Return-Path: <jailhouse-dev+bncBCJ557OB7UPRBDF2XP2QKGQEZLDWBQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 3095F1C2D31
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 May 2020 17:02:38 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id q5sf3284693pgp.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 May 2020 08:02:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588518156; cv=pass;
        d=google.com; s=arc-20160816;
        b=EGvwV51D8eyUT1mhNOF0t2sjSfwreE11EVfnYoCLbcofgBHC24sLc3df4oFjeWLtpM
         /LM7MoHGFKVnibLIC60xw8O5tnIaZU/9HtkWlsWKhKM0ydqjznBpHDXUHvQBgPncW797
         PynsIL/yqGQqFxNdTE0CbHryejoxniNRz1bUqsr2XC6R/95/oe/r5brGLoEBI5JZguJm
         Qj9l+0dCOeROtis7uaIHs1lBZAw1GZZPORWaqxslk+LNEuRzeI+wITqpqpjh2gL8GHbi
         aqvVmMCgDea0mehnw0+pdcMJdtENb71QH1lMip+VPRkAUUM7vv/yw19W6QkQQ55dwIaG
         Fcig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=L0Bif7fn6SnB14aUEp53zbNiLG+oxIiBJMov2sCosqg=;
        b=pzkc0y6eYBc4cF0mRB3ZS2Hh0x+47xvFA+/OIRbSL2KNXIzKlMwu2QXoeEoTEYq6AW
         u8dug4XEZ1l/bbeHHlwiNJcowe/H799Qs99ZdtPO8P0hE0nBiinDv1Gh2jjO7aKFMFma
         kVp8YgU+Xvrz6HsSel5Mz/zQLbIH8ctIA8YBn9xEm/bi4G8ntaKDxKb64eCHknCCpTds
         NLQ0iUWh1tV9xGZAo3WxdEytDsrh7w9nWtHyZdA/OpNLkdRHK//zeXRZ+B7NlnmD9J/4
         swQ4ReklT9OWVfLZglKWSd3tRfpOF2ZzgGUvzvF2VZm4h7g4N7BRszPlWUwP5YBYUGeS
         2YOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nQ9unaGc;
       spf=pass (google.com: domain of siregueye690@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=siregueye690@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L0Bif7fn6SnB14aUEp53zbNiLG+oxIiBJMov2sCosqg=;
        b=ChlpqEJuWF7M+d98mY5B+k8rqAHmkBDVobMX+GKVXfqjsRmRAFTjuc4I1TaECyG6ug
         u4P3TIrGsfWHQt3S52nti5pz7ymruKWoRKjCokqhAvn9j//2Ph4ssO56AmGM8/Irhi8e
         8AYl1ZR92XnXMz2XAOXU6Y/IfFBeKQbBWAc0Ab4OilJPdCDHYGJMoYqWq9iwnPb1f8Yk
         jIU6OET5lq763FeNA3YJooGAqDJCcT1pc72T9/wydRt8DLeIfrJAaAhnjjJDQbxympC4
         8y1gxpssHWkSAYodifMQIzI6o8V+ovJHYW3cNeu+D2blKuXmDE5ma4NTIbO3FFHTlf24
         kOcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L0Bif7fn6SnB14aUEp53zbNiLG+oxIiBJMov2sCosqg=;
        b=Dxg4PKhtTeH3+XMBen8LIY/5jZDoEpJ4/F5WHiRIvzqcSFy+u909ubY0oMDA8Lhd63
         J7C7k5leGsCs60uJ9ILHjkPCgqyQkARwjbSyXraoaEfr4etlaR6IOANhJh4UZVrWwWje
         TOoawU03akt8yg9Bzmwp/7Ybhpfh+oXJPg+to2EpFu/ukhi0pxMmlOBcnscUJTkKyOdI
         xj5EQ4iIgSOkanWiBNv+uobLGWQAI/QCk4Y6Lcj5o7I2FdcSiSLTr+2G+AmT2Pg1SRiU
         lBLPKAnLtjShE+odrDgqxR3JI+PGNq/513hg0vtaYschDU4omK3er3xIiAif/EO6b6Ek
         4QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L0Bif7fn6SnB14aUEp53zbNiLG+oxIiBJMov2sCosqg=;
        b=OQvnTKdZwbVqjJmy7xgwGp/2a0qmKIcF4oDKDsSbLf1Uiv0cEFYENqsh0vh271Lw5E
         Om71E9PUPb7q4e4boJE0GWa75PCVWvWmXMpgtn5SpRWBPEmeUpUYA0tKcNJBSwyULe9S
         HT0xUiEVH/EpCS420GH+nb/rF5O78V6Mj3YmIJv/c+8fEY2/rq/EyuZPoCDi4uyq8xju
         QpH84bGUuzQl0Io/DJJDIuMVuYsF3JGxf+Dw5GuydZjS49LhOjdKHdsyvkT+bkK2vgnb
         sFYFjj6oXLPySBSOVHaZkMxhExGzaBFZWARUuI89oACxZ+tbhNhp1WQT7WaWKMB5JfQ0
         liZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pubp4djHT7oEfyOX+6h+DdMGxOcrTpzjqCpilGjwsLPP2kdar3q/
	7z3EGd4XxXf797liYg/Kyag=
X-Google-Smtp-Source: APiQypILlBUSzCcnN31B2GKcvLx9lIcQhe6cCKEWc85ky2W3+jtHaN1/34ssNeS72amlU2ppGoEpLQ==
X-Received: by 2002:a17:90a:f197:: with SMTP id bv23mr11792553pjb.3.1588518156579;
        Sun, 03 May 2020 08:02:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:6a48:: with SMTP id f69ls11999944pgc.8.gmail; Sun, 03
 May 2020 08:02:35 -0700 (PDT)
X-Received: by 2002:a63:c00a:: with SMTP id h10mr13735518pgg.238.1588518155830;
        Sun, 03 May 2020 08:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588518155; cv=none;
        d=google.com; s=arc-20160816;
        b=JyTmOwpcG+RSSZctXZfo3bM6TqUujFHpMIkAJLftMAZlZmVqf7xaD41AvxVX1xc4o6
         gQBZTsPRYpjEnu+UZXvKJUIXX9kJ1QeL1kuihaE1/YD28/np92mJsUd7n2r/pT9ThSDC
         7eZf47nGuwx4w2e7/HHgtuFudwJeNF4jl+/mA0kmyQzMHrCamywLKhMQUPxiVAkkIxY6
         ZtHoLmCRFVLSuBFpjmN8Itx4DKFUr5YhgNaWi3HXOYTW0DGD5LaNagvaXObUI0Rx0tjQ
         FsqchUaEZlW8JfRo/mLzNkK0zLMblyeFGcCCHIzJZT0+V9XIHZPBL0+PW+oEtleyy5oV
         aVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AUPFVebkMCP2d6yXFLiX1kRiXR3fvLCGSwVbHCCnyec=;
        b=xFs+P2Wl1QCoX2NR5hO/rpyWnb/no0u0s/P6hRqMXgO/HkZnsXal+J9w2jynAtELQt
         FhGmk2XSu0jiLGhUtSQEW9ej3kC0jhLbiGgqFQoH9kFmjENsp8XPcrZSovWMhgd9R9PG
         6l8Fw1abXKjdcfbvMIrmUYJCULITywGqi9t8dRCFH48kHtf2sie1trnzYPtQPhUXgMzG
         HxWfftLQ5u/K96ORKE+FtAN9QH4prcawJ4MX5CHlIkMYAibAgBHz04FUDGeGvmDg/xSP
         fDjBoouHAuf8sktWWMzvYHhTfDU3m62QsxPO87VeqHvTdFEO2Kp3Sosbxc12+KVxJXbI
         +z3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nQ9unaGc;
       spf=pass (google.com: domain of siregueye690@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=siregueye690@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com. [2607:f8b0:4864:20::142])
        by gmr-mx.google.com with ESMTPS id q5si224673pgl.1.2020.05.03.08.02.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2020 08:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of siregueye690@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) client-ip=2607:f8b0:4864:20::142;
Received: by mail-il1-x142.google.com with SMTP id b18so8925751ilf.2
        for <jailhouse-dev@googlegroups.com>; Sun, 03 May 2020 08:02:35 -0700 (PDT)
X-Received: by 2002:a92:89d5:: with SMTP id w82mr12029591ilk.153.1588518155393;
 Sun, 03 May 2020 08:02:35 -0700 (PDT)
MIME-Version: 1.0
From: Amelia Ibrahim <ameliaibrahim520@gmail.com>
Date: Sun, 3 May 2020 16:02:25 +0100
Message-ID: <CAGtvjUjJKyhVkgQxwt8zSDkEdhaRORAy1tVH-YW+8EThc2Vemg@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000005f1dd405a4bfb412"
X-Original-Sender: ameliaibrahim520@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=nQ9unaGc;       spf=pass
 (google.com: domain of siregueye690@gmail.com designates 2607:f8b0:4864:20::142
 as permitted sender) smtp.mailfrom=siregueye690@gmail.com;       dmarc=pass
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

--0000000000005f1dd405a4bfb412
Content-Type: text/plain; charset="UTF-8"

 Hello, I will like to talk with you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGtvjUjJKyhVkgQxwt8zSDkEdhaRORAy1tVH-YW%2B8EThc2Vemg%40mail.gmail.com.

--0000000000005f1dd405a4bfb412
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0Hello, I will like to talk with you=C2=A0 =C2=A0=C2=
=A0<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGtvjUjJKyhVkgQxwt8zSDkEdhaRORAy1tVH-YW%2B8EThc2V=
emg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGtvjUjJKyhVkgQxwt8zSDkEdhaRORAy1tVH-YW%=
2B8EThc2Vemg%40mail.gmail.com</a>.<br />

--0000000000005f1dd405a4bfb412--
