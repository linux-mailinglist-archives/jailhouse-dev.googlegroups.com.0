Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBDODTWEQMGQEFTE5NKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DF3F84AF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 11:40:31 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id n14-20020a0c9d4e0000b0290354a5f8c800sf2029997qvf.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 02:40:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629970830; cv=pass;
        d=google.com; s=arc-20160816;
        b=XayOZ3AWdGJoMJBaao6/atF/468rner9FxWWG9FSHjGoaAXB9bE6MgGS8HuvG9U4nN
         m9Ca34JLWI9yVzBaLgaP2309S5PwqALjNVfXE2BBcUgpYhDJuYJxijNNUpDjnSLnMMr/
         MsbjbvZm+2AghN9nJpd5jMaalyykHhOugas8nIi7Oj13awFjCjWL/7AUSlxXfh5j8ivJ
         aLFkIE6xT20G4qjC3O5fgWrfrJBrQWT0tFM03A/xfh/RozNl0jQ/HapWViZBb+ljekae
         mIZzAmRwDfLzNGvSVcvoNlvx26bcO6GfadDK7lfrkYJsVJF+t3WzmymXrZpIUs9mE6e/
         2csg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=w5MP1lyyWVkFXlqMdvyxTOa7JJP30XEG2h103DAPMg4=;
        b=Sg5UlwdprzPrnY5Y6xgqxbzl6NvJAhK9fGvQHYSBgKKCF7naeSXwPQMzgg5xQPcayJ
         ZBa/pvIdkDLZqqi6EMN6SMft3uV8dMZPdIsv0+5ABZ/MNISz0RVmnVwvO9l91pbu7vrL
         MAHVE82zjLcD+GI+AQ2+rWifyLDJ9ONiWzDOmwdTA1TxnFcJ5zQmWVcHtY/4liCVEJW3
         bB3lTiiZFTh/TubLCphRBjqbYY+kHEtwTLFfWaEdG3rqw0qsMIbq2gqWUrJsk0DUZqwQ
         oy7Gt+XOF//uecQ2Wylg7kGiSNDO+Rp7Fe0CgcUpETf3yKN5G2sFnuEr52Yh7q1hx6/s
         d+rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YSWFlzv8;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w5MP1lyyWVkFXlqMdvyxTOa7JJP30XEG2h103DAPMg4=;
        b=XblGuFM/eLj8txwOjbdch72h36NxaIyQS8vYPhAsidpoK1qfgDUj8nd7DJJZHjVoE0
         u1wFdu0yqjIijh+zdaTHtE+9NQn+3vyvJyewpLbgFnTkNuy+fwmjWam8dkZSU0kKtbas
         aapNw/7hcU9os5jfm9zvKagNMz0eOdZRn/Wuc3l+5YGx00/kNaUbEG22XsIk8D+lPtE2
         o4ZGc86X2ulKkAOx5ozU5ppc5iHV+wH+CpSuq3fhEEcFTAzGA9bZVegmZoG3wbVdfkV9
         KSmbxz+9WCiTUAlsMe3Y2jIAuFvRz17AQTErlCO5wZfbeXOwdx5k2uHtT+KVli/cIvIL
         fDmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w5MP1lyyWVkFXlqMdvyxTOa7JJP30XEG2h103DAPMg4=;
        b=rUfPtsaPHBHj0e3hgbi3nGY8meH/xbPCDVo3mmaCsgFrcEUr2ja/d7eU72Viyt5Lr1
         4OnWsLAqTPRgqTfo/roF4PnNg5zpQiKzz+PzOAepxbmWXG4CIIyRIED0aXXDxLnXpDOE
         XtjfBYKLdYEDjiRSUC6WB8HcAO5anEZwD1KA5RavZX+OWp+54QZTsDKdMN5zWV1cx4kP
         RbEAGe6dN82LusBqdmhiLqKrevzIYzrQaEpqu7F4nT7CGWmcuJiPij2gfH9FDNuQWmoO
         m7PawezUboQl6Ev9YBkx/DKM5toc0co7J0Vww6NgmZACcS8ThrPZ9UjqvbE837BMek6J
         bXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w5MP1lyyWVkFXlqMdvyxTOa7JJP30XEG2h103DAPMg4=;
        b=tM2uJSEhcqFE/zBDL/qAAgJawXxFBLg8//uh5Mu93VshvxFsA9moBTVbcr9ymwfYVC
         1Ks11HS5m4C/TpRG25SzRXyYAQXazKa61mpKaX9/+82oRPROljE6JhHlXDg23+4pO/ZR
         SpeJ5WqDPKZKM5koFYUPtaafdIjzJHDUzW9iV2yJLO69Z0NM61l29J74kiNwerb4jz5z
         Z2F5RiFZODyyx01TLwzoCD5SF1eUH9exQfD7Od+GUH82S1xEev72e7lF4VbSVg2aBXGX
         kcXVM7lB8Ivtcrm/tpAxHUEyBbQKe5JGMK/JZrBu0sC5BvSiZT4Oi58QhDh7BhSak55J
         GEqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532f1nqLpWOLlWRdbS41meabC6z+0FOF/1+FSmlBFbAN12z02J/p
	7kG/EvHzfQW6nDWpgV73+Wo=
X-Google-Smtp-Source: ABdhPJwkpUng7I868AapdJ1/2gA0etz2AH9XZvYUWP/jiNKGBNZajQpfxLFUC1ng/Vgg4kZyVxvSAQ==
X-Received: by 2002:ac8:5c08:: with SMTP id i8mr2379680qti.314.1629970830117;
        Thu, 26 Aug 2021 02:40:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f4c6:: with SMTP id o6ls1086362qvm.7.gmail; Thu, 26 Aug
 2021 02:40:29 -0700 (PDT)
X-Received: by 2002:ad4:58ea:: with SMTP id di10mr3077005qvb.60.1629970829554;
        Thu, 26 Aug 2021 02:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629970829; cv=none;
        d=google.com; s=arc-20160816;
        b=0FnfiIkCk8pXTlFX4zwbQYwKi53zjv7/pwmCfW4kSTgYxHuXOv0TY6zTEW8HNH13w/
         mxlY7aAylr+0yux1T7/CxYDtVgrJjn6NQIIxdfLRlsJZGnMcPOLBbBfxkjFUzU5nWVgV
         aOaLG4j3IXheMsCKkyu7UP6KQ4Gd82fyhMHRCwGPrerIYtiN80QLboD4eG19hPIwElxA
         K7wvvFigEyQV7cQ2U/jWkld/l4jqzAzmfpcLAbVjC5b2E4g3qU+dVJXDIqqmo20F351K
         xdctQ771wdHeYOfRT2ThMzD+F5NxvR5/nHUqeMvUabZkAvcrOuOn1A8ycCdIARMIVi3q
         hJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=iGe+ff0xx93BVhnTOH2BfT8XCPRu4fqv57IZtLOyE4Q=;
        b=JPfSeS+FgbTMV8RcU+2wuxP6GxK/1B/AjMciW9hlwPtqWGqDxcdNXhiD+pCFaOZuqq
         5lesWzCG4TBy2HY8pxUHwatwWKf8T3mgEJ2H9PpRrvFz3GHGYs6Kg5GLv4Xv678RhCmG
         Uomno/r6GEVHNKFFgcz+i2Nnt2Xpg48xSemsqNHj1htSSn/DjqgcU3Qc8uQQoyokMKSc
         OS/hjpAj+W577zOwZ+bllymluzPSelGpvr78z/QiTtxAf+UNjvUO6EdXtBfaklb+k/dW
         7ZQmp1GOBMu23gtKNZYrbac7VB2lZNG5ZpbMggzJhA5UgLaKgNRcPscrzAEDt3HOzU/R
         izOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YSWFlzv8;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com. [2607:f8b0:4864:20::743])
        by gmr-mx.google.com with ESMTPS id g18si174094qto.2.2021.08.26.02.40.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 02:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) client-ip=2607:f8b0:4864:20::743;
Received: by mail-qk1-x743.google.com with SMTP id t4so2590636qkb.9
        for <jailhouse-dev@googlegroups.com>; Thu, 26 Aug 2021 02:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr2752050qko.191.1629970829160;
 Thu, 26 Aug 2021 02:40:29 -0700 (PDT)
MIME-Version: 1.0
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Thu, 26 Aug 2021 17:40:19 +0800
Message-ID: <CABSBigRew4uS4Hg2QAvRgLJM3MvV60ff3E1wvsv+U52u-MYTbA@mail.gmail.com>
Subject: No need to add spin_loc() and spin_unlock() for cpu_public - cpu_suspended
To: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=YSWFlzv8;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

Hi,
     I see  cpu_public->cpu_suspended is protected by spinlock,  but I
see there is no concurrency problem for the cpu_public->cpu_suspended.
 check_events() is the only place to change cpu_public->cpu_suspended
variable=EF=BC=8C other CPU can not change is variable, also  check_events(=
)
is
not preempted in the current CPU, because IRQ is masked in the current
CPU.  So there is no need to add spin_lock for
cpu_public->cpu_suspended variable.


static void check_events(struct public_per_cpu *cpu_public)
{
        bool reset =3D false;

        spin_lock(&cpu_public->control_lock);

        while (cpu_public->suspend_cpu) {
                cpu_public->cpu_suspended =3D true;

                spin_unlock(&cpu_public->control_lock);

                while (cpu_public->suspend_cpu)
                        cpu_relax();

                spin_lock(&cpu_public->control_lock);
        }

        cpu_public->cpu_suspended =3D false;
         ..............
        spin_unlock(&cpu_public->control_lock);
        ............
}

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigRew4uS4Hg2QAvRgLJM3MvV60ff3E1wvsv%2BU52u-MYTbA%40mail.=
gmail.com.
