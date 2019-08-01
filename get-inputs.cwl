#/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool
label: parses list of URLs and generates an array to scatter over

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
- class: InlineJavascriptRequirement

inputs:
  url_list:
    type: File
    label: list of URLs to download from
    inputBinding:
      loadContents: true
  fn_list:
    type: File
    label: list of filenames
    inputBinding:
      loadContents: true

outputs:
  urls:
    type: string[]
  filenames:
    type: string[]

expression: "${var url_lines = inputs.url_list.contents.split('\\n');
               var fn_lines = inputs.fn_list.contents.split('\\n');
               var url_len = url_lines.length;
               var fn_len = fn_lines.length;
               var urls = [];
               var filenames = [];
               for (var i = 0; i < url_len; i++) {
                  var url = url_lines[i];
                  if (url) {
                    urls.push(url);
                  }
                }
               for (var x = 0; x < fn_len; x++) {
                  var fn = fn_lines[x];
                  if (fn) {
                    filenames.push(fn);
                  }
                } 
               return { 'urls': urls, 'filenames': filenames } ;
              }"
