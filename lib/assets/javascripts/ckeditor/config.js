CKEDITOR.editorConfig = function (config)
{
  config.toolbar_Minimalist =
  [
      { 
        name: 'menu-1',
        items : [ 
                  'Bold', 'Italic', 'Underline', '-',
                  'TextColor', 'BGColor', '-', 
                  'NumberedList','BulletedList','-',
                  'HorizontalRule','SpecialChar','-',
                  'Link','Unlink','-',
                  'Undo','Redo'
                ] 
      },
      '/',
      { 
        name: 'menu-2', 
        items : [
                  'Outdent','Indent','-',
                  'Cut','Copy','Paste','-',
                  'Maximize'
                ]
      }
  ];
  
  config.toolbar = 'Minimalist';
};