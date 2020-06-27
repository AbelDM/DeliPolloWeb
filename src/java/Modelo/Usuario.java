package Modelo;

public class Usuario {
    private int codusu;
    private String apeUsu;
    private String nomUsu;
    private String distrito;
    private String perfil;
    private String correo;
    private String claveUsu;

    public Usuario(int codusu, String apeUsu, 
            String nomUsu, String distrito,
            String perfil, String correo, String claveUsu) {
        this.codusu = codusu;
        this.apeUsu = apeUsu;
        this.nomUsu = nomUsu;
        this.distrito = distrito;
        this.perfil = perfil;
        this.correo = correo;
        this.claveUsu = claveUsu;
    }

    public int getCodusu() {
        return codusu;
    }

    public void setCodusu(int codusu) {
        this.codusu = codusu;
    }

    public String getApeUsu() {
        return apeUsu;
    }

    public void setApeUsu(String apeUsu) {
        this.apeUsu = apeUsu;
    }

    public String getNomUsu() {
        return nomUsu;
    }

    public void setNomUsu(String nomUsu) {
        this.nomUsu = nomUsu;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClaveUsu() {
        return claveUsu;
    }

    public void setClaveUsu(String claveUsu) {
        this.claveUsu = claveUsu;
    }
    
    
    
}
