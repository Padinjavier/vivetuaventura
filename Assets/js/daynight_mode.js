const changeTheme = (selectedValue) => {
    switch (selectedValue) {
        case '0':
            addTheme(lightTheme);
            $textState.textContent = 'DAYMODE';
            break;
        case '1':
            addTheme(darkTheme);
            $textState.textContent = 'NIGHTMODE';
            break;
        case '2':
            addTheme(tardeTheme);
            $textState.textContent = 'LATEMODE';
            break;
    }
}
console.log("sssssss")
const lightTheme = {
    // Definiciones de estilo para el tema claro
        '--HEADERHOVER':'#2153f8',
        '--HEADER':'#6587f8',
        '--blue':'#007bff',
        '--indigo':'#6610f2',
        '--purple':'#6f42c1',
        '--pink':'#e83e8c',
        '--red':'#dc3545',
        '--orange':'#fd7e14',
        '--yellow':'#ffc107',
        '--green':'#28a745',
        '--teal':'#20c997',
        '--cyan':'#17a2b8',
        '--white':'#FFF',
        '--gray':'#6c757d',
        '--gray-dark':'#343a40',
        '--primary': 'var(--HEADER)',
        '--secondary':'#6c757d',
        '--success':'#28a745',
        '--info':'#17a2b8',
        '--warning':'#ffc107',
        '--danger':'#dc3545',
        '--light':'#f8f9fa',
        '--dark':'#343a40',
        '--breakpoint-xs':' 0',
        '--breakpoint-sm':' 576px',
        '--breakpoint-md':' 768px',
        '--breakpoint-lg':' 992px',
        '--breakpoint-xl':' 1200px',
        
        '--font-family-monospace':' SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace',
      
      
};

const darkTheme = {
    // Definiciones de estilo para el tema oscuro
};

const tardeTheme = {
    // Definiciones de estilo para el tema tarde
};
