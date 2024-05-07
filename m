Return-Path: <jailhouse-dev+bncBAABBJW25GYQMGQEQIYZPYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 578728BEB0B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2024 20:04:24 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id 5b1f17b1804b1-416ac21981dsf27465e9.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2024 11:04:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715105063; cv=pass;
        d=google.com; s=arc-20160816;
        b=GdX1DZPiKctOLxu2PBFhoxmH+3/pd2amnG4opRaI1xvZlwq+blSB0p5ylxOjq59Uop
         +KvLBFM6Hgr0Wh/sEshDWN7311DegK39ZIvBJdcjmKaqcyjB50EsW9p0ZclkSJ6vefMA
         O8pY8fszIrHEHk4IFK80PN5aY5aVocFk+HkdZjhS3fW2H2aZOJg11sXUvbLNyNzkHUsl
         wEwEj5jhPswnGy7tPpMWyZPxLRrVPJ5PNzFoiEkg/z4zZ4pUIBS2Oippd/tzQBOv6bUX
         i2cVIZQfVfZiYPYCi0OUNpECDtjHWXfkGx+8LigxZZVYe87nXVZbxm4JqUZJUeh4bFJK
         ndTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:references:mime-version
         :subject:message-id:from:date:dkim-signature;
        bh=AqDapaQyhx8YuyoBRvytRystzVy74IKPZW6AMld3cJc=;
        fh=oyKuu/b1TsyzOEFCRWB+hbxZykGkzGgUqyF/PIsr05M=;
        b=MvUGtVXYE0ZT2wYpteqQ9ervCjq2gZP1VtfA0BuHN8BfmOqGL/wnS9S/O5ECaugscC
         mERz5ytz+YKr9knUmLpPbruyK/gRAGqNGm3mCgFBX+EGNyDYTsFX8dIMmxlYVJBNIj1x
         9YQ7j6J4pselBsfD8mYm/LCu6Gh4WE9v2exnvKIenyxDA4ep2Zh5b4tnx++NB0FmkIvZ
         7uLiaME4saAs5t9TR2AbAmbD7li0Ku9TX/LUlaxl4Gk2BBj1c5lOLcbC7dxp6B6lfi7/
         C+Uqe3e9EEuqnc2KmeS16byqpybco6eIBMrfbb1dd90cMAaqdewXM7TWjLAtfX5CFJYo
         hPYg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=OGuVpTKc;
       spf=pass (google.com: domain of info.artiis@yahoo.com designates 77.238.176.99 as permitted sender) smtp.mailfrom=info.artiis@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1715105063; x=1715709863; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:references
         :mime-version:subject:message-id:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqDapaQyhx8YuyoBRvytRystzVy74IKPZW6AMld3cJc=;
        b=ki9LGFNaXkL86JtQAdBDn7//byVgxb3uveuDiXvaXzV+W0hoQKZLSkePUfbVOi9x5j
         txOZce39jNP0kvq3WaxPYZu72Zb4p1RyRtt5aYfIq+ctxR3rbzja7e2QkbG6YBqHlBFF
         ZsRYBzIj+FOOPtngnc6bmInD/qaqwB8qf125+WUyeq3tr1McxG4banUoLBwxtHn2g7nj
         r0yyHJYXl/KAQ1RmX+xwYFUkhr4BzJ2mtx0KHBQQOtHH3x+/+pklEqpNo0drCsy6aMhv
         MrM3V1frCK6tcpBJeYRvB/ttDm23uPMBiAIDQdSkqMU8GunzmN5GFEFED00LYeu8GF/g
         5yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715105063; x=1715709863;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:references
         :mime-version:subject:message-id:from:date:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqDapaQyhx8YuyoBRvytRystzVy74IKPZW6AMld3cJc=;
        b=qUQDbdfaoESNIhYvJAab/FEdDpwNqZnUFp+W8dNDW6/7LasuDr6RihNu8nMCrpIa/0
         DdJgN8F49IKl30ehPuzZm/ehNARkOipnAJi8pF8VNqgsqVoFZuDHtP9uqxqj+zOeg6iV
         iQMoT1OhYQfik5bnVYoA3GRRURx8jrVmyVl7JMVLNibteKX8U1LkRasck84iDhrFCu5C
         YUVMCWP9WDpmthMkbFFMmZKEW9i9mlACX9/W+H3cYKqoMqqovPhwQ17DvxP+38gceljz
         Mj2VyrV4qmUbZzo4k9pfSdUU2iEM8lQIeEa4puAvAz8sBoPfnCXZAIveQA1IuBCE/8pQ
         QdSQ==
X-Forwarded-Encrypted: i=2; AJvYcCXLavamPAQ8c2OCJrMX0xz4OftacVAOnTrmswqaaEL5QBnWYci4Ce/ZXXJZnjGeqSS/jXuPBOA/0C7npTCFSc+xSWhd298oXh2p3YM=
X-Gm-Message-State: AOJu0YwQKC7kgH/9wyDYPl2cbgb1DAj450zwFGT/8xud/M/2OqYXah7f
	maK3oTBUcSQvT1LYcjlURn65VCmrCrKCSknwEhZkMrzJC1tHNlpP
X-Google-Smtp-Source: AGHT+IFNOCnWi9qfGhuZd7muWQPvm9IwoCPoBeKpJzD1R/bbGMp0BLYsWulQkwUiaJfDCuYhZI1IKQ==
X-Received: by 2002:a05:600c:3b93:b0:41c:73d:63b3 with SMTP id 5b1f17b1804b1-41f71aca9b9mr5009715e9.3.1715105062838;
        Tue, 07 May 2024 11:04:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4689:b0:418:b8a5:dbf3 with SMTP id
 5b1f17b1804b1-41f7b47f9efls45885e9.1.-pod-prod-00-eu; Tue, 07 May 2024
 11:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcxbdycS7RX18roXGn0C8NKufdxMh9PsNiR8ZcWzncxVSeCJOim6E1sAsameoIeh/bEDzcxsGyltzM5GXEcqRL4Dv+9mQXhb8kubIiiDI=
X-Received: by 2002:a05:600c:4f07:b0:41a:56b7:eb37 with SMTP id 5b1f17b1804b1-41f721ad43fmr4227275e9.20.1715105060301;
        Tue, 07 May 2024 11:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715105060; cv=none;
        d=google.com; s=arc-20160816;
        b=e4k/gdQ26S7Fh3vPERzC2M4pFgB+y2wHM2qExUi91untbz68gx1XbnjOSEMMAe6DN9
         UH/TYcx4t3j1Xx0ujb//adfKpuaE11Oc13eHiUWzpBAvtgRreZB8ctG14FwNF7CyFYAU
         wyl0EvGHWEbu8VyOIwj3Vudqp+qn7P6Cuz7hMPjwbGXuZtxfBZVI0cNl5oOaQMG9b+bV
         q+aKn5c8J/Vacv13N7AMUzcsedpdN5Z4QL0ecHsnJb3WAccgEYhYk7gL4OuLggTK5UPr
         sS9fHsMtimkgsdIIo796XP3e3qIdNl1m00vDWPsk5mgTNtmOYIlT9Rl17TreRqoe8Thu
         07OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:mime-version:subject:message-id:from:date:dkim-signature;
        bh=/+F7ZQ444LOlZIk/6DOf3G+GfVx6fIUiKqTSxH97INU=;
        fh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ze1J61xAO9kTCui0mU7s7EAfJZFPuIweYjEyseClIw93nEqHv3vu0lGtVqmODDVufx
         r6iTXjD+8TSVBo34v8fr14yoPTmrWvnLeuwRaL1RisznEwNlg26jlfC0/yPLhWJQpHG1
         UzPqMmjUUTfJe5uUEuIig/mxM+j34pgwhhjI7tj0V/iSwiuP7ZxzshCp9XvlInnjYoT3
         rS0xpDhylMkENO8vAu0yd2QHzoYXl6lBdiPGOcZ0Ob4Q3nsBw+3dLVvAnVH6D2ahIC7l
         jut6HA6mnx2kZR+CEwgCpWaZ6q76+JXedJ+RicYfRDtXmgxnqjChGcOGOTPt3WPnMJaF
         F3Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=OGuVpTKc;
       spf=pass (google.com: domain of info.artiis@yahoo.com designates 77.238.176.99 as permitted sender) smtp.mailfrom=info.artiis@yahoo.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from sonic301-22.consmr.mail.ir2.yahoo.com (sonic301-22.consmr.mail.ir2.yahoo.com. [77.238.176.99])
        by gmr-mx.google.com with ESMTPS id 5b1f17b1804b1-41f4d07597csi585105e9.1.2024.05.07.11.04.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 11:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of info.artiis@yahoo.com designates 77.238.176.99 as permitted sender) client-ip=77.238.176.99;
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1715105059; bh=HqqHkEcBj5hXKiqDRFI+AoLb2WLBS+WuEyoO/TRcTOR=; h=X-Sonic-MF:Date:From:Subject:From:Subject; b=IubG4JJNsye+NUusNXFv2taS/TUrwKL+byNS/QgeAGZVtBC003ld0GXJVJlEqQl8jTBAG2s9LHd3gBUsJ6e/JNHJi7lyToMGD/qGyIgR6cXhTeecRrQl5uM1BEPPLd6R2YT05z8pXR7AFIMBLiyxk9ft2Jx+BUz7EuPVZ7lpEu9mDDs3hkq36AxrewQ7uW7tRj4l6Rqp7koW69QnINXVP0E26SL1qs++n+twGIZjOOUixv5YEehFW63yZDF0GKHYDE9A5pBTqZozjavhMQDFhus1y/8FrRPrH72FiKhEpEB2ypsXi9Y4mFI6vEX8z8JMiml6G/Lwn57oza+B7VB0yA==
X-YMail-OSG: iwpGTzYVM1me_oGujUwwrcP1q9FNh3TPOEMIQjjbsQ4PzfUohNO.J1lCFOrCSfN
 HTeD2cWz6YeGM41JG5NH5OnIHHsSkGWzVazJRot9nSwS2gZRVFSPJ6hegrom.MOq9uQEzaC3vJS6
 TJcLnMA03xsS04mM_yxRDduL6sGvNtmNUrpY6qGbwphocTUt7eMyM.mt6RbvWzOzoeBE29v.EFZa
 L.kYAgOZWKm483By7Thpzf5k37jLoIon5RByUuuK.8esnXQ3x6qtOunJS6Uk4HMZqO.xZMZ3uWGE
 YV33TKX3fBSO4f_688IO7s2FILJ1nyLwLCdOt3F60iQx9ENakW_y1cv8cEfLRw8RaIIIV97SBtnQ
 pgwpFHRiKV052EsKj2OxiQdLqZor4x.1RYZ3mXu2KH6fBliuuDz56YBORh_S1ad5jdMgvC7SfUjZ
 PIL.yF9URBxBbsf.YXynVhqnVYLWJr_fSFm7zZSTUNiTKHZvyyDiTZw3EydTwRwP7gjS7IzwVnKm
 W.BS1URsHBCl0UXXvzpAwMb_nHL800oMs3xKuG6W3jf1WCnb5IPAOudEkjHYE9fYGhLukCv15WVA
 IIK5q_Jx7PWjKz82k7EYQXs2aO62AnOECR_REi_T0HIUSY0fkJ0dhy37VA6Qd8jlM5h05r2LIgNJ
 qD89LBoiTioTS0SOlvnIQHzDctVgAjYHVcTdkaivf3FQtjH4H98HuRmkblJmllmws4h_fwwILffH
 J1P4jACpX8Xec0qxc.1XLEe3ha_F.oUSgt1bXWODN06lkBVbPC8z0UhkYfD26xBBAHhjjovFLnl9
 YOongpJMmDLwHTp7jZhkYJ3HnqAQGyh8Sr0qO45ORtZpHt4eRZEdWktCR0IH0zajDCSXl3s3WoRA
 PQBJN1wtYGBrIzS.8Vc0sHUiBwvdhuK.ENnfFWhc0NXLv8HMA99seVC1a9bbN6ZLqm7ZkvF.DXNE
 JZzvFgPGZoM1sFgIiP8QMfuaVf70gnI9PpyhgeOxamSRm4CHNPFBjtU.hj824IzTrUB7frjmip.5
 jpjHBzPsn5Kn50FhTEzTbenavVPkS1GTbqSLbbyxa7OLT0kDEOiIkbfqYkpfpHN4N9M_f2qLo0e1
 y4vRRqz2HwCEoSNEV8efSzWEEIqFds4xCZgIEPK73_rV6siL20OoKHjzBikSvDhl6_aXOnNUHgqS
 KZqyCRlyGrvrsBh2ztj7hp3pdaw5pGYPk1zqr6D_g1ywZnmY7pPo.ezrVQK7nLnCUIQwQQYSRJj2
 SCZea6HjWvSbDkC5Q9zsNXgHezULh44hFmTmOvzmLRcMNVRq6IeRNvY7d3mI7fkL_ijeoFNwy9eF
 6n7IOmCGIxnxZtIr9abjKh44eoFDTYmyTDUXZUAUBD.NHrXXPeZkI5f34dS5EaxKWQp3OiXJ9QaX
 kpZu5Z8T96iDsEsV_blouqUNd3e9MIqZjIWEb46ynawV3cmFA7xmBymHTLA92VKbAlD8wCTy6E.x
 ImXJGPtnDvGzfsYLtDkm89tkYfcgZAQSRIg4Iv5kra1tCQaiXwGGHs9rK0eeJ.1WqEwwTcUOze1M
 6b.piWbYGD0JjGa6VD0wLyUkS9fWVPPH5beAwvhCJ0g1UhNe.QTOa8j0XJEbqKHCg9q8Kz4fgcD3
 lLzE2qMCJXzbtXCLM3bKnBgrl4KOjRi2u5e25U56siTcbfVrdSpXYG1Z24FeoOPhO5CWrGXF7f0q
 lHzzg1xH_JHH5IHh.FeDGQlDgWcofXC4S1oIEnuZfuqEx0V.VatAdNDALYxC7nU14exAuzIsFHPd
 Zj1nJHOOr9LQ6UjXl_aPCFKabccX6B0VYWOSNaS4MfOy2x3UxqUw5TsT2fdBiiTjEavxZeFBMGFe
 CroRHPnbvrEV9V6ZSpG3arYf5qswh6JDLutJrJM0aymtBHp2Y0jlIDM9RVCNEjcdld_yrNa8VbX3
 uKWY0X22bWf8WHnEOrIIWNtAdly77AKxoivYBNl0OHaMmpZVLJfUKSc2UDKZ_8FiYVUzTdD1vP__
 IXYElNBZQwtKcE2laRQ3gE.Y5lWMT0vnxEqeXdPZMDi5i7520izw5nvg5Ql0rXLTfXe86_5XzqJv
 2QSHR5JyDPUV2r6YUMGF_uY0HtwZNh65hR6ZF3VNIEXZjLtt.owmh6dePpGcKyvUwVKfE3EzP1k.
 HRUTaCC9m1Je_pP6qHiQwKs7zWUPigpMhqH9.eg--
X-Sonic-MF: <info.artiis@yahoo.com>
X-Sonic-ID: 10952084-f642-4c82-9a9d-377a77040e2c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ir2.yahoo.com with HTTP; Tue, 7 May 2024 18:04:19 +0000
Date: Tue, 7 May 2024 18:04:16 +0000 (UTC)
From: "'Info Artiis' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <1926824237.12317894.1715105056509@mail.yahoo.com>
Subject: ARTIIS 2024 and Special Sessions CFP - Santiago de Chile, Chile -
 Hybrid format - Indexed by Scopus
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_12317893_2092403360.1715105056505"
References: <1926824237.12317894.1715105056509.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22256 YMailNorrin
X-Original-Sender: info.artiis@yahoo.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@yahoo.com header.s=s2048 header.b=OGuVpTKc;       spf=pass
 (google.com: domain of info.artiis@yahoo.com designates 77.238.176.99 as
 permitted sender) smtp.mailfrom=info.artiis@yahoo.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
X-Original-From: Info Artiis <info.artiis@yahoo.com>
Reply-To: Info Artiis <info.artiis@yahoo.com>
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

------=_Part_12317893_2092403360.1715105056505
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



|=20

| International Conference on Advanced Research in Technologies, Informatio=
n, Innovation and Sustainability (ARTIIS 2024)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0



=C2=A0
 |

 |
|=20
| CALL 4 PAPERS DEADLINE=C2=A0MAY=C2=A020=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Hybrid format

Indexed by Scopus
 |

 |
|=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0https://www.artiis.org/=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
 |
|=20
|=20
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0

Dear Researcher

We cordially invite you to participate in the International Conference on A=
dvanced Research in Technologies, Information, Innovation and Sustainabilit=
y (ARTIIS 2024),=C2=A0to be held=C2=A0at=C2=A0Universidad Andr=C3=A9s Bello=
, on October 21-23,=C2=A0Santiago de Chile,=C2=A0Chile.=C2=A0

The conference will be in a hybrid format (in-Person and Virtual).

Main conference and Special Sessions proceedings will be published with=C2=
=A0Springer in their Communications in Computer and Information Science ser=
ies (CCIS)=C2=A0with Springer. CCIS is abstracted/indexed in DBLP, Google S=
cholar, EI-Compendex, SCImago, Scopus. CCIS volumes are also submitted for =
inclusion in ISI Proceedings.=C2=A0Last=C2=A0ARTIIS CCIS Proceedings.

Submitted papers should be related to one or more of the main themes propos=
ed.


1. Computing Solutions
- Applied Information Systems (e.g. Healthcare, Law, Economics, Education)
- Web and Mobile Applications
- Networks, Mobility, Ubiquity and Pervasive Systems
- Innovative Computing
- Gamification Application and Technologies
- Software Engineering

2. Data Intelligence
- Advanced Computational Intelligence
- Computer Vision and Image Processing
- Artificial Intelligence and Data Science
- Data Engineering, Analytics, and Applications
- Intelligent and Decision Support Systems
- Information and Knowledge Management

3. Sustainability
- Immersive Tech and the Future of Smart Cities
- Industrial Advanced Internet of Things
- Internet of Things Environment
- Sustainable Infrastructure Development
- Technology, Marketing and Socio-economic challenges

4. Ethics, Security, and Privacy
- Information and Telecommunication Systems Security
- Innovative Communication Networks and Security
- Vulnerabilities of Interoperability and Information system
- Interdisciplinary Information Studies
- Ethics of Social Sciences for Computer Applications







=C2=A0=C2=A0Beyond the Main Conference ARTIIS 2024=C2=A0there are several S=
pecial Sessions:
  =20
   - ACMaSDA 2024:Applications of Computational Mathematics to Simulation a=
nd Data Analysis
   - BTDT 2024: Business, Technology and Digital Transformation  =20

   - CICITE=C2=A02024:Challenges and the Impact of ICT on Education
   - GAT=C2=A02024: 2nd Workshop on Gamification Application and Technologi=
es
   - ISTIIS=C2=A02024: International Symposium on Technological Innovations=
 for Industry and Society
   - ISHMC=C2=A02024: Intelligent Systems for Health and Medical Care
   - SMARTTIS 2024: Smart Tourism and Information Systems
   - ET-AI 2024: Emergent Technologies and Artificial Intelligence
   - IWET 2024: International Workshop on Electronic and Telecommunications
   - TechDiComM 2024: Technological Strategies on Digital Communication and=
 Marketing
   - glossaLAB 2024:=C2=A0Bridging Knowledge in a Fragmented World
   - #RTNT=C2=A02024:=C2=A0Emerging Technologies to Revitalize Tourism
   - CICT 2024: Cybersecurity in Information and Communication Technologies
   - WIN-WIN-4S 2024:=C2=A0Workshop on IoT Networks and Wireless for sustaI=
Nability  =20

   - JIUTE 2024: Innovation in Educational Technology  =20



Selected papers will be invited to publish an extended version in:

  =20
   - SN Computer Science, Springer Nature
   - Computation, MDPI
   - EAI Endorsed Transactions on Smart Cities, open access, peer-reviewed =
scholarly journal,=C2=A0EAI=C2=A0




We are waiting for you!




For more information Artiis.org







Kind RegardsARTIIS Team

 |

 |



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1926824237.12317894.1715105056509%40mail.yahoo.com.

------=_Part_12317893_2092403360.1715105056505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir=
=3D"ltr" data-setdir=3D"false"><div><div><br></div><div><div class=3D"ydp1b=
6710dbyiv3633688439ydp1861c7b8I_ZkbNhI ydp1b6710dbyiv3633688439ydp1861c7b8D=
_FY ydp1b6710dbyiv3633688439ydp1861c7b8W_6D6F" style=3D"font-family: &quot;=
Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; width:=
 940.037px;"><div class=3D"ydp1b6710dbyiv3633688439ydp1861c7b8msg-body ydp1=
b6710dbyiv3633688439ydp1861c7b8P_wpofO ydp1b6710dbyiv3633688439ydp1861c7b8m=
q_AS"><div class=3D"ydp1b6710dbyiv3633688439ydp1861c7b8jb_0 ydp1b6710dbyiv3=
633688439ydp1861c7b8X_6MGW ydp1b6710dbyiv3633688439ydp1861c7b8N_6Fd5"><div =
id=3D"ydp1b6710dbyiv3633688439ydp1861c7b8yiv6020560108"><div class=3D"ydp1b=
6710dbyiv3633688439ydp1861c7b8yiv6020560108ydpdb7cc995yahoo-style-wrap"><di=
v dir=3D"ltr"><div><table width=3D"640" align=3D"center" bgcolor=3D"#ffffff=
" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"color: rgb(96, =
96, 96); font-family: Arial, sans-serif; font-size: 14px; margin: 0px; padd=
ing: 0px; border: 0px currentcolor; width: 640px; border-collapse: collapse=
;"><tbody><tr><td width=3D"640" align=3D"center" bgcolor=3D"#383838" style=
=3D"margin: 0px; padding: 0px; border: 0px currentcolor; width: 640px; bord=
er-collapse: collapse; background-color: rgb(56, 56, 56);"><br><table width=
=3D"600" align=3D"center" bgcolor=3D"#383838" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0" style=3D"padding: 0px; border: 0px currentcolor; width:=
 600px; border-collapse: collapse;"><tbody><tr><td width=3D"600" align=3D"l=
eft" bgcolor=3D"#383838" style=3D"margin: 0px; padding: 0px; border: 0px cu=
rrentcolor; width: 600px; border-collapse: collapse;"><div style=3D"margin:=
 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 16px;"><font si=
ze=3D"4">International Conference on Advanced Research in Technologies, Inf=
ormation, Innovation and Sustainability (ARTIIS 2024)</font>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;</div><p align=3D"center" style=3D"margin: 0px; paddin=
g: 0px; color: rgb(255, 255, 255); line-height: 16px;"><br></p><p style=3D"=
margin: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 10px; fo=
nt-size: 10px;">&nbsp;</p></td></tr></tbody></table></td></tr><tr><td width=
=3D"640" align=3D"center" bgcolor=3D"#ffffff" style=3D"margin: 0px; padding=
: 0px; border: 0px currentcolor; width: 640px; border-collapse: collapse;">=
<table width=3D"600" height=3D"120" align=3D"center" bgcolor=3D"#ffffff" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin: 0px; paddin=
g: 0px; border: 0px currentcolor; width: 600px; border-collapse: collapse; =
min-height: 120px;"><tbody><tr><td width=3D"200" height=3D"120" align=3D"le=
ft" valign=3D"middle" bgcolor=3D"#ffffff" style=3D"margin: 0px; padding: 0p=
x; border: 0px currentcolor; width: 200px; border-collapse: collapse; min-h=
eight: 120px;"><span style=3D"margin: 0px; padding: 0px; color: rgb(147, 20=
2, 29); text-transform: uppercase; line-height: 24px; font-size: 20px; font=
-weight: bold;">CALL 4 PAPERS DEADLINE&nbsp;MAY&nbsp;20&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td><td w=
idth=3D"400" height=3D"120" align=3D"right" valign=3D"middle" bgcolor=3D"#f=
fffff" style=3D"margin: 0px; padding: 0px; border: 0px currentcolor; width:=
 400px; border-collapse: collapse; min-height: 120px;"><p><span style=3D"ma=
rgin: 0px; padding: 0px; color: rgb(147, 202, 29); line-height: 24px; font-=
size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hybrid format</span></p><p align=3D=
"right"><span style=3D"margin: 0px; padding: 0px; color: rgb(147, 202, 29);=
 line-height: 24px; font-size: 20px;"><span style=3D"margin: 0px; padding: =
0px; line-height: 24px;"><font color=3D"#0080ff" style=3D"background-color:=
 inherit;">Indexed by Scopus</font></span></span></p></td></tr></tbody></ta=
ble></td></tr><tr><td width=3D"640" align=3D"center" bgcolor=3D"#e7860d" st=
yle=3D"margin: 0px; padding: 0px; border: 0px currentcolor; width: 640px; b=
order-collapse: collapse; background-color: rgb(231, 134, 13);"><h1 style=
=3D"margin: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px=
; font-size: 20px;"><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</em><a hr=
ef=3D"https://www.artiis.org/" style=3D"color: rgb(17, 85, 204); text-decor=
ation-line: underline;" rel=3D"nofollow" target=3D"_blank"><font color=3D"#=
ffffff"><font size=3D"2"><em>https://www.artiis.org/&nbsp;</em></font></fon=
t></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1></td></tr><tr><t=
d width=3D"640" align=3D"center" bgcolor=3D"#ffffff" style=3D"margin: 0px; =
padding: 0px; border: 0px currentcolor; width: 640px; border-collapse: coll=
apse;"><font color=3D"#000000"></font><font color=3D"#000000" size=3D"2"></=
font><font color=3D"#000000" size=3D"2"></font><font color=3D"#000000" size=
=3D"2"></font><table width=3D"600" align=3D"center" bgcolor=3D"#ffffff" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin: 0px; padding=
: 0px; border: 0px currentcolor; width: 600px; border-collapse: collapse;">=
<tbody><tr><td width=3D"430" height=3D"50" bgcolor=3D"#ffffff" style=3D"mar=
gin: 0px; padding: 0px; border: 0px currentcolor; width: 430px; border-coll=
apse: collapse; min-height: 50px;"><p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</p><f=
ont color=3D"#000000" size=3D"2"><p style=3D"color: rgb(96, 96, 96); font-s=
ize: 14px;"><font color=3D"#000000" size=3D"2">Dear Researcher</font></p><p=
 style=3D"color: rgb(96, 96, 96); font-size: 14px;"><font color=3D"#000000"=
><font size=3D"2">We cordially invite you to participate in the Internation=
al Conference on Advanced Research in Technologies, Information, Innovation=
 and Sustainability (ARTIIS 2024),&nbsp;</font></font><span style=3D"color:=
 rgb(0, 0, 0); font-size: small;">to be held</span><span style=3D"color: rg=
b(0, 0, 0); font-size: small;">&nbsp;</span><font size=3D"2" style=3D"color=
: rgb(0, 0, 0);">at&nbsp;<strong>Universidad Andr=C3=A9s Bello</strong>, on=
 October 21-23,&nbsp;<strong>Santiago de Chile</strong>,&nbsp;<strong>Chile=
</strong>.</font><span style=3D"color: rgb(0, 0, 0);">&nbsp;</span></p></fo=
nt><font color=3D"#000000" size=3D"2"><p style=3D"color: rgb(96, 96, 96); f=
ont-size: 14px;"><font color=3D"#000000" size=3D"2">The conference will be =
in a hybrid format (in-Person and Virtual).</font></p><p style=3D"color: rg=
b(96, 96, 96); font-size: 14px;"><font color=3D"#000000" size=3D"2">Main co=
nference and Special Sessions proceedings will be published with<strong>&nb=
sp;<font color=3D"#f04e00">Springer in their Communications in Computer and=
 Information Science series (CCIS)</font></strong>&nbsp;with Springer. CCIS=
 is abstracted/indexed in DBLP, Google Scholar, EI-Compendex, SCImago, Scop=
us. CCIS volumes are also submitted for inclusion in ISI Proceedings.&nbsp;=
Last&nbsp;<a href=3D"https://link.springer.com/conference/artiis" style=3D"=
color: rgb(17, 85, 204); text-decoration-line: underline;" rel=3D"nofollow"=
 target=3D"_blank">ARTIIS CCIS Proceedings</a>.</font></p><p style=3D"color=
: rgb(96, 96, 96); font-size: 14px;"><font color=3D"#000000" size=3D"2"><fo=
nt color=3D"#000000" size=3D"2"><span style=3D"text-align: center; color: r=
gb(33, 37, 41); font-family: Lato, sans-serif; font-size: 12px;"><span styl=
e=3D"font-size: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9=
pt; vertical-align: baseline;"><font color=3D"#000000" style=3D"background-=
color: inherit;"><font color=3D"#000000" size=3D"2">Submitted papers should=
 be related to one or more of the main themes proposed.</font></font></span=
></span></span></font></font></p><blockquote dir=3D"ltr" style=3D"color: rg=
b(96, 96, 96); font-size: 14px; margin-right: 0px;"><p><font color=3D"#0000=
00" size=3D"2"><font size=3D"2"><font color=3D"#000000"><strong>1. Computin=
g Solutions</strong><br>- Applied Information Systems (e.g. Healthcare, Law=
, Economics, Education)<br>- Web and Mobile Applications<br>- Networks, Mob=
ility, Ubiquity and Pervasive Systems<br>- Innovative Computing<br>- Gamifi=
cation Application and Technologies<br>- Software Engineering</font></font>=
</font></p><p align=3D"left"><font color=3D"#000000" size=3D"2"><font size=
=3D"2"><font color=3D"#000000"><strong>2. Data Intelligence</strong><br>- A=
dvanced Computational Intelligence<br>- Computer Vision and Image Processin=
g<br>- Artificial Intelligence and Data Science<br>- Data Engineering, Anal=
ytics, and Applications<br>- Intelligent and Decision Support Systems<br>- =
Information and Knowledge Management</font></font></font></p><p><font color=
=3D"#000000" size=3D"2"><font size=3D"2"><font color=3D"#000000"><strong>3.=
 Sustainability</strong><br>- Immersive Tech and the Future of Smart Cities=
<br>- Industrial Advanced Internet of Things<br>- Internet of Things Enviro=
nment<br>- Sustainable Infrastructure Development<br>- Technology, Marketin=
g and Socio-economic challenges</font></font></font></p><p><font color=3D"#=
000000" size=3D"2"><font size=3D"2"><font color=3D"#000000"><strong>4. Ethi=
cs, Security, and Privacy</strong><br>- Information and Telecommunication S=
ystems Security<br>- Innovative Communication Networks and Security<br>- Vu=
lnerabilities of Interoperability and Information system<br>- Interdiscipli=
nary Information Studies<br>- Ethics of Social Sciences for Computer Applic=
ations</font></font></font></p></blockquote><p style=3D"color: rgb(96, 96, =
96); font-size: 14px;"><font color=3D"#000000" size=3D"2"><font size=3D"2">=
<span style=3D"text-align: center; font-family: Lato, sans-serif; font-size=
: 12px;"><span style=3D"font-size: 9pt; vertical-align: baseline;"><span st=
yle=3D"font-size: 9pt; vertical-align: baseline;"><font color=3D"#0000ff" s=
tyle=3D"background-color: inherit;"><font color=3D"#000000" size=3D"2"><spa=
n style=3D"color: rgb(33, 37, 41); font-size: 12px;"><span style=3D"font-si=
ze: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9pt; vertical=
-align: baseline;"><font color=3D"#000000" style=3D"background-color: inher=
it;"><font size=3D"2"><font color=3D"#000000"><br></font></font></font></sp=
an></span></span></font></font></span></span></span></font></font></p><p st=
yle=3D"color: rgb(96, 96, 96); font-size: 14px;"></p><p style=3D"color: rgb=
(96, 96, 96); font-size: 14px;"><font color=3D"#000000">&nbsp;<font color=
=3D"#000000">&nbsp;<font size=3D"2"><strong>Beyond the Main Conference ARTI=
IS 2024&nbsp;there are several Special Sessions</strong>:</font></font></fo=
nt></p><ul style=3D"color: rgb(96, 96, 96); font-size: 14px;"><li style=3D"=
margin-left: 15px;"><font color=3D"#000000" size=3D"2"><strong><a href=3D"h=
ttps://www.artiis.org/special-sessions/acmasda-2024" style=3D"color: rgb(17=
, 85, 204); text-decoration-line: underline;" rel=3D"nofollow" target=3D"_b=
lank">ACMaSDA 2024</a></strong>:<font color=3D"#000000" size=3D"2">Applicat=
ions of Computational Mathematics to Simulation and Data Analysis</font></f=
ont></li><li style=3D"margin-left: 15px;"><font color=3D"#000000" size=3D"2=
"><font color=3D"#000000" size=3D"2"><b><a href=3D"https://www.artiis.org/s=
pecial-sessions/btdt-2024" style=3D"color: rgb(17, 85, 204); text-decoratio=
n-line: underline;" rel=3D"nofollow" target=3D"_blank">BTDT 2024</a></b>: B=
usiness, Technology and Digital Transformation<br></font></font></li><li st=
yle=3D"margin-left: 15px;"><font color=3D"#000000" size=3D"2"><font color=
=3D"#000000" size=3D"2"><a href=3D"https://www.artiis.org/special-sessions/=
cicite-2024" style=3D"color: rgb(17, 85, 204); text-decoration-line: underl=
ine;" rel=3D"nofollow" target=3D"_blank"><strong>CICITE&nbsp;</strong><stro=
ng>2024</strong></a>:Challenges and the Impact of ICT on Education</font></=
font></li><li style=3D"margin-left: 15px;"><font color=3D"#000000" size=3D"=
2"><font color=3D"#000000" size=3D"2"><a href=3D"https://www.artiis.org/spe=
cial-sessions/gat-2024" style=3D"color: rgb(17, 85, 204); text-decoration-l=
ine: underline;" rel=3D"nofollow" target=3D"_blank"><strong>GAT&nbsp;</stro=
ng><strong>2024</strong></a>: 2nd Workshop on Gamification Application and =
Technologies</font></font></li><li style=3D"margin-left: 15px;"><font color=
=3D"#000000" size=3D"2"><a href=3D"https://www.artiis.org/special-sessions/=
istiis-2024" style=3D"color: rgb(17, 85, 204); text-decoration-line: underl=
ine;" rel=3D"nofollow" target=3D"_blank"><strong>ISTIIS&nbsp;</strong><stro=
ng>2024</strong></a><strong>: International Symposium on Technological Inno=
vations for Industry and Society</strong></font></li><li style=3D"margin-le=
ft: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"><a href=3D"https://www.artiis.org/special-sessions/ishmc-2024" style=
=3D"color: rgb(17, 85, 204); text-decoration-line: underline;" rel=3D"nofol=
low" target=3D"_blank"><strong>ISHMC&nbsp;</strong><strong>2024</strong></a=
>: Intelligent Systems for Health and Medical Care</font></font></li><li st=
yle=3D"margin-left: 15px;"><font color=3D"#000000" size=3D"2"><font color=
=3D"#000000" size=3D"2"><strong><a href=3D"https://www.artiis.org/special-s=
essions/smarttis-2024" style=3D"color: rgb(17, 85, 204); text-decoration-li=
ne: underline;" rel=3D"nofollow" target=3D"_blank">SMARTTIS 2024</a></stron=
g>: Smart Tourism and Information Systems</font></font></li><li style=3D"ma=
rgin-left: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000=
" size=3D"2"><strong><a href=3D"https://www.artiis.org/special-sessions/et-=
ai-2024" style=3D"color: rgb(17, 85, 204); text-decoration-line: underline;=
" rel=3D"nofollow" target=3D"_blank">ET-AI 2024</a></strong>: Emergent Tech=
nologies and Artificial Intelligence</font></font></li><li style=3D"margin-=
left: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" siz=
e=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"=
2"><font color=3D"#000000" size=3D"2"><strong><a href=3D"https://www.artiis=
.org/special-sessions/iwet-2024" style=3D"color: rgb(17, 85, 204); text-dec=
oration-line: underline;" rel=3D"nofollow" target=3D"_blank">IWET 2024</a><=
/strong>: International Workshop on Electronic and Telecommunications</font=
></font></font></font></font></li><li style=3D"margin-left: 15px;"><font co=
lor=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><strong><a hr=
ef=3D"https://www.artiis.org/special-sessions/techdicomm-2024" style=3D"col=
or: rgb(17, 85, 204); text-decoration-line: underline;" rel=3D"nofollow" ta=
rget=3D"_blank">TechDiComM 2024</a></strong>: Technological Strategies on D=
igital Communication and Marketing</font></font></li><li style=3D"margin-le=
ft: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"><strong><a href=3D"https://www.artiis.org/special-sessions/glossalab=
-2024" style=3D"color: rgb(17, 85, 204); text-decoration-line: underline;" =
rel=3D"nofollow" target=3D"_blank">glossaLAB 2024</a>:</strong>&nbsp;Bridgi=
ng Knowledge in a Fragmented World</font></font></li><li style=3D"margin-le=
ft: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"><strong><a href=3D"https://www.artiis.org/special-sessions/rtnt-2024=
" style=3D"color: rgb(17, 85, 204); text-decoration-line: underline;" rel=
=3D"nofollow" target=3D"_blank">#RTNT&nbsp;2024</a>:</strong>&nbsp;Emerging=
 Technologies to Revitalize Tourism</font></font></li><li style=3D"margin-l=
eft: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"><strong><a href=3D"https://www.artiis.org/special-sessions/cict-2024=
" style=3D"color: rgb(17, 85, 204); text-decoration-line: underline;" rel=
=3D"nofollow" target=3D"_blank">CICT 2024</a></strong>: Cybersecurity in In=
formation and Communication Technologies</font></font></li><li style=3D"mar=
gin-left: 15px;"><font color=3D"#000000" size=3D"2"><font color=3D"#000000"=
 size=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"></font></font><font color=3D"#000000" size=3D"2"><font color=3D"#000=
000" size=3D"2"><strong><a href=3D"https://www.artiis.org/special-sessions/=
win-win-4s-2024" style=3D"color: rgb(17, 85, 204); text-decoration-line: un=
derline;" rel=3D"nofollow" target=3D"_blank">WIN-WIN-4S 2024</a></strong>:&=
nbsp;Workshop on IoT Networks and Wireless for sustaINability<br></font></f=
ont></font></font></li><li style=3D"margin-left: 15px;"><font color=3D"#000=
000" size=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" =
size=3D"2"><font color=3D"#000000" size=3D"2"><b><a href=3D"https://www.art=
iis.org/special-sessions/jiute-2024" style=3D"color: rgb(17, 85, 204); text=
-decoration-line: underline;" rel=3D"nofollow" target=3D"_blank">JIUTE 2024=
</a></b>: Innovation in Educational Technology<br></font></font></font></fo=
nt></li></ul><font color=3D"#000000" size=3D"2"><font color=3D"#000000" siz=
e=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"=
2"><blockquote dir=3D"ltr" style=3D"margin-right: 0px;"><p><font size=3D"2"=
><span style=3D"text-align: center; font-family: Lato, sans-serif; font-siz=
e: 12px;"><strong>Selected papers will be invited to publish an extended ve=
rsion in:</strong></span></font></p></blockquote><ul><li style=3D"margin-le=
ft: 15px;"><div><font size=3D"2"><span style=3D"text-align: center; font-fa=
mily: Lato, sans-serif; font-size: 12px;"><a href=3D"https://www.springer.c=
om/journal/42979" style=3D"color: rgb(17, 85, 204); text-decoration-line: u=
nderline; font-size: 14.66px;" rel=3D"nofollow" target=3D"_blank"><span sty=
le=3D"font-family: Lato, Arial; font-size: 9pt; font-weight: 700; vertical-=
align: baseline;">SN Computer Science</span></a><span style=3D"font-size: 9=
pt; vertical-align: baseline;">, Springer Nature</span></span></font></div>=
</li><li style=3D"margin-left: 15px;"><font size=3D"2"><span style=3D"text-=
align: center; font-family: Lato, sans-serif; font-size: 12px;"><span style=
=3D"font-size: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9p=
t; vertical-align: baseline;"><font size=3D"2" style=3D"background-color: i=
nherit;"><span style=3D"font-size: 12px;"><span style=3D"font-size: 9pt; ve=
rtical-align: baseline;"><span style=3D"font-size: 9pt; vertical-align: bas=
eline;"><strong><u><a href=3D"https://www.mdpi.com/journal/computation" sty=
le=3D"color: rgb(17, 85, 204);" rel=3D"nofollow" target=3D"_blank"><font si=
ze=3D"2"><span style=3D"font-size: 12px; font-weight: 400;"><span style=3D"=
font-size: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9pt; v=
ertical-align: baseline;"><strong><u>Computation</u></strong></span></span>=
</span></font></a></u></strong>, MDPI</span></span></span></font></span></s=
pan></span></font></li><li style=3D"margin-left: 15px;"><div><font size=3D"=
2"><span style=3D"text-align: center; font-family: Lato, sans-serif; font-s=
ize: 12px;"><span style=3D"font-size: 9pt; vertical-align: baseline;"><span=
 style=3D"font-size: 9pt; vertical-align: baseline;"><font size=3D"2" style=
=3D"background-color: inherit;"><span style=3D"font-size: 12px;"><span styl=
e=3D"font-size: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9=
pt; vertical-align: baseline;"><a href=3D"https://l.facebook.com/l.php?u=3D=
https%3A%2F%2Feudl.eu%2Fjournal%2Fsc%3Ffbclid%3DIwAR0cN29XwFNcdbsI6V0ZEbSF6=
PY2MsJOGZAymgMCUEcCIObnOBfq1UK68O8&amp;h=3DAT3KIMbGL2GxfHWsUCpYK4Y1ncg7Yxt_=
FbVwHSoOf7I7EQpp_68wfZYSfpoAL69BtFA0ojGQ1cLMACY9L0hM-YHPH5dqorfKP_iuzzXxC6q=
eER3GjsRvseOvGlFQB5jNepA" style=3D"color: rgb(17, 85, 204); text-decoration=
-line: underline; font-size: 14.66px;" rel=3D"nofollow" target=3D"_blank"><=
span style=3D"font-family: Lato, Arial; font-size: 9pt; font-weight: 700; v=
ertical-align: baseline;">EAI Endorsed Transactions on Smart Cities</span><=
/a><span style=3D"font-size: 9pt; vertical-align: baseline;">, open access,=
 peer-reviewed scholarly journal</span><span style=3D"font-size: 9pt; verti=
cal-align: baseline;">,&nbsp;</span><span style=3D"font-size: 9pt; vertical=
-align: baseline;">EAI&nbsp;</span></span></span></span></font></span></spa=
n></span></font></div></li></ul><p><font size=3D"2"><span style=3D"text-ali=
gn: center; font-family: Lato, sans-serif; font-size: 12px;"><span style=3D=
"font-size: 9pt; vertical-align: baseline;"><span style=3D"font-size: 9pt; =
vertical-align: baseline;"><font color=3D"#0000ff" style=3D"background-colo=
r: inherit;"><font color=3D"#000000" size=3D"2"><span style=3D"color: rgb(3=
3, 37, 41); font-size: 12px;"><span style=3D"font-size: 9pt; vertical-align=
: baseline;"><span style=3D"font-size: 9pt; vertical-align: baseline;"><fon=
t color=3D"#000000" style=3D"background-color: inherit;"><font color=3D"#00=
00ff"><font color=3D"#0000ff"><span style=3D"font-size: 9pt; vertical-align=
: baseline;"><br></span></font></font></font></span></span></span></font></=
font></span></span></span></font></p></font></font></font></font></font><p>=
<font color=3D"#0c7423"><strong>We are waiting for you!</strong></font></p>=
<font size=3D"2"><p><font size=3D"2"></font></p><p><font size=3D"2"><br><fo=
nt color=3D"#000000">For more information Artiis.org</font></font></p><p></=
p><p></p></font><p><br></p><div><font color=3D"#000000" size=3D"2">Kind Reg=
ards</font></div><div dir=3D"ltr"><font color=3D"#000000" size=3D"2">ARTIIS=
 Team</font></div><p></p></td></tr></tbody></table></td></tr></tbody></tabl=
e></div><br></div></div></div></div></div><div class=3D"ydp1b6710dbyiv36336=
88439ydp1861c7b8jb_0 ydp1b6710dbyiv3633688439ydp1861c7b8X_6MGW ydp1b6710dby=
iv3633688439ydp1861c7b8N_6Fd5"></div></div><div class=3D"ydp1b6710dbyiv3633=
688439ydp1861c7b8H_7jIs ydp1b6710dbyiv3633688439ydp1861c7b8D_F ydp1b6710dby=
iv3633688439ydp1861c7b8ab_C ydp1b6710dbyiv3633688439ydp1861c7b8Q_69H5 ydp1b=
6710dbyiv3633688439ydp1861c7b8E_36RhU" style=3D"font-family: &quot;Helvetic=
a Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;"></div></div><=
/div><br></div></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1926824237.12317894.1715105056509%40mail.yahoo.com=
?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/=
jailhouse-dev/1926824237.12317894.1715105056509%40mail.yahoo.com</a>.<br />

------=_Part_12317893_2092403360.1715105056505--
