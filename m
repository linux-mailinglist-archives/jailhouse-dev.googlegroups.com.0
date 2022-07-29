Return-Path: <jailhouse-dev+bncBCZ3RCOBYMNBB6OSR2LQMGQELOUOG5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4E584E11
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 11:33:47 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id k1-20020a2e9201000000b0025dd56bd7a4sf831639ljg.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 02:33:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659087226; cv=pass;
        d=google.com; s=arc-20160816;
        b=WXs1CtPm8BG1whO+9/kML5RAsqP3lnDk9en+zuKetU0v2ZOwtBLFrxoZAGhH35UNuq
         UMoRWfF1jZINBdx1bYUFq6hK2M4i4V2umNcL9YiirUxX0O2HhItuTKfTznWR78vaa6/f
         Wqs/64YFeZ7EL0g3lPe6v5FjYivtwNwykOXx710HgTF9GaP6qYVv4IkYV6JDUu6ZY7ey
         HJqnsyWLcXgD6tIH/KfqeGG0F/MNqobSwvUyI7bcZyqUT7ZswhY/LNApWC1Jo4CECu/c
         yD2xLArezZn/FWHS2XbbkNEZy5RZJ1iwfsPnLBudwd719NOs8NW05jdnl8Q9oTwSAAc9
         giQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=3DGzaEBt8MiPt8lCQv/iED1CuVsYfGklwRqFr4sqOMg=;
        b=fQq9Cu0Mf0obPswgyOzDXyy1qizYUUkEwoy7lm+zWPc1Ep2yvQHvf3TjmeDWECsVhv
         8ZMjHJ+p53CSTmjP63WgpZ6Cd33jC1y065DPcsqcOKwfag6GhL876QaPgaTuAMT2jDgA
         saV9Dq0C0fMaqjdsgb0CPUHlLgccl7kva/OtBR6HO36dxtlIMihRlEp7PoNFD1oBBAfe
         Zi8NbiUyo3f0/zj9iKyFgpR7sktlThXZ1FlARA/GpyXPIPx6hSjCCqsdizcpI8pBcV1R
         lZn4Bqcx7B63HNj4yXKvy3kQH2JJt2GAXDLyskqBwe9hNVs3BCujToDBQGdmEUMN4Ba1
         gjxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GMOimfCH;
       spf=pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3DGzaEBt8MiPt8lCQv/iED1CuVsYfGklwRqFr4sqOMg=;
        b=nBOd+qMlR484TRgc+ywB1U7P/h69hpU1NGKzX9M2RnzJkIhvOKuqlcyRz3t+gNrBYd
         vBC11b2q4nTHHqm88zxQR4TEMLJzRqDb90cy5pZTxvTkK0A9Gf2QIX6BRG4HWJP3b+zc
         9vUEehpS7PHfzlfwDCuODbugVhNXOo98s+ukEd6b151m1aiF3JHO3Sd5H/1M2vk68D47
         74kCCsozF2mBljXnWZawQCApyeGYS52+vqA6vOs0sRfXMT/g46XRhkaKRIJuGEkapSdt
         BLTZOu/IE2A9fplUk8HMOMuFHEiG6lxJwMDuq7B/4HPY2DCW1Tz2fFTeX3dtsHbd3btl
         v6bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3DGzaEBt8MiPt8lCQv/iED1CuVsYfGklwRqFr4sqOMg=;
        b=KqsUskYe/Zjav7YCrDlGHDnG66VTdU+YL7/uBYWio0Jkjzp9OIVt8mCBECeIE/xJZd
         pIqFkwG2noWdsukkC27+lSFu0EONS/G6moGsdSVjFaF9raBqDoig4G5uv6nuhbsYTKuo
         zkH6Q1ZdUAfQV7pXaL48H6PulpxKuYTTOhXAvIzbJS/wQv199NucqMm25ZhtNol20rfg
         50NX/b1CCfeUj0+LsAIR8dj4mI3z7EuYPaRyIyAJVim32RTxRMEba1R1MO4FVDF4DSIT
         M77VIrfixnLb9yAg1mpvkDaZAdTXPWcFF3AISCGS9uPGayQSBT/0Gb+/QrWKfB4kUKAd
         u5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3DGzaEBt8MiPt8lCQv/iED1CuVsYfGklwRqFr4sqOMg=;
        b=qsS8GcIPRTP1H0/tnA9PJgD5/c0JeHIUUW5BrtOjouV4bQxsH3BUhqEnvrmMabzE2s
         d3Cg/UWRJ+GxnX+9599ZAnQTlZLirs8tiEEb6XGppuGBYc22XcdBNyina/gR+cq0buvG
         ov41dLGenaXtMsr7Qf5cSoRDShGmDRUbdkvsuWzWkSlHJytrkVBNYoCQMFXFdT/+i6FI
         odQ7IsEySnoFMKAqG3q0oGxQtM7YdlVfS8dMWSRCjDitGb/Yf1u/iYXWh7pOzSJ8FJa/
         p1lxIdGbH2sgl+pZMOuHycAIg3F5B8yj6Cnzk8YmJi1f+r6SP7X+2SjauSszxzmwsisH
         /NaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+l3qTGsgK9FeJb4Nsn99ak7qEi/EqmAd7CNr0QEByQggaolWQR
	XmboK0OJJXmSYglZpq5qI6g=
X-Google-Smtp-Source: AGRyM1uPBhxvYj2Z6A6HCEPLdQJQY9tYoaoIJrPwkbYlY6OnGjZkPAoD9HrcEmH6kQQMQjARQflR/A==
X-Received: by 2002:a05:6512:3b82:b0:48a:a3f4:abae with SMTP id g2-20020a0565123b8200b0048aa3f4abaemr1009375lfv.155.1659087226540;
        Fri, 29 Jul 2022 02:33:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c03:0:b0:25d:30d4:30e4 with SMTP id j3-20020a2e3c03000000b0025d30d430e4ls707686lja.9.-pod-prod-gmail;
 Fri, 29 Jul 2022 02:33:44 -0700 (PDT)
X-Received: by 2002:a2e:b8cb:0:b0:25e:2951:217b with SMTP id s11-20020a2eb8cb000000b0025e2951217bmr786799ljp.95.1659087224569;
        Fri, 29 Jul 2022 02:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659087224; cv=none;
        d=google.com; s=arc-20160816;
        b=Prqx1BQCYfBe5xuaJlXZpECSFr5vfDbMco5rTVso5ArryJJ355h/rOIPYkBRSQVDaP
         +Mn3DoFtKAMtRMpDKvM2OvfNjv2Ehk51pxwLibHaT08iCBu8QKMrUjQ5XEmvpX4mT4BC
         ikG0mlwRr/ZYU6EpVDA6Slb4GRGL9kpl3CH/+n+3W8pUb5uFdTNYOCi98a/KsHjSnuAI
         w0KNVLDW0px8puZpvQymwNRZQlP5tnxFa1u2u3OvsBhMBcc32xOqNvGAA5a2JSIZCqcL
         oBcJot8lYpAfKmdviV7wM8paL8QPbN6BphY3pu2z3dJfO17/R4DMUaMPiKqM2Hs/Qz6y
         vFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n9XedV9FxkfeXGJj5eRx6HgqaIguAOVpacWhqzffxwQ=;
        b=x0QO6dquOU9chjAzS1hvsgLzkEsDAXXNaCqfCD1q8lW6fqLkg1EIIpjgvr6SuVpNkL
         tyH9Phl8Wz+pKvLd/KQiKMMSmcGbySKfM1qnpzNAsHeju6fFaD3y+lSEXuiO9t1NleI2
         4G+WFtOcdgqWFR7+Yhqc1C26i+X/d1kzJC4h+CRhYgSA9wj8rB/B4ZirOZKkj7lfmOay
         eILeRD/beV2cV5BZnpn968L/rRSaGeyQnIKKSXJePEwdz9yJjgyBJAyDg6zad5Eu73AR
         L2KYoFWg9DUPYNjOUvsOo4IZwTn/g6M8Vb7ccKbSBL0M4yiEWEukjqT/zMq/NMRxcbNs
         7+4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GMOimfCH;
       spf=pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com. [2a00:1450:4864:20::52e])
        by gmr-mx.google.com with ESMTPS id a4-20020a056512200400b0048a88bf3ef2si128299lfb.8.2022.07.29.02.33.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 02:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) client-ip=2a00:1450:4864:20::52e;
Received: by mail-ed1-x52e.google.com with SMTP id c12so5127351ede.3
        for <jailhouse-dev@googlegroups.com>; Fri, 29 Jul 2022 02:33:44 -0700 (PDT)
X-Received: by 2002:a05:6402:d45:b0:43c:b9f5:9ed1 with SMTP id
 ec5-20020a0564020d4500b0043cb9f59ed1mr2662239edb.309.1659087224003; Fri, 29
 Jul 2022 02:33:44 -0700 (PDT)
MIME-Version: 1.0
From: Sara Alonso <alonsosara44@gmail.com>
Date: Fri, 29 Jul 2022 11:33:32 +0200
Message-ID: <CACD6wFOpQ3ZNBDtPoz+LLS57gxAZ3JuDOi_1orGKqPKiC7s4jA@mail.gmail.com>
Subject: Troubles running jailhouse
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000a3607205e4ee5837"
X-Original-Sender: alonsosara44@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=GMOimfCH;       spf=pass
 (google.com: domain of alonsosara44@gmail.com designates 2a00:1450:4864:20::52e
 as permitted sender) smtp.mailfrom=alonsosara44@gmail.com;       dmarc=pass
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

--000000000000a3607205e4ee5837
Content-Type: text/plain; charset="UTF-8"

Hi!

I am trying to run jailhouse in a zcu102 board following this tutorial:
https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md
But I am new at this and I have some troubles.

I have built the petalinux-project and also jailhouse.  I have copied into
the SD: the image.ub, BOOT.BIN, system.dtb, inmate-zynqmp.dtb,
zynqmp-zcu102.cell and zynqmp-zcu102-inmate-demo.cell in the BOOT partition
and the rootfs.cpio + the lib and usr files installed when jailhouse is
compiled in the ROOT partition. I don't know if something else is required
or if something is not needed.

The project is running, but if I do "modprobe jailhouse" it says:
modprobe: module jailhouse not found in modules.dep
I think I have followed all the steps of the tutorial. What could be
happening?

Thank you very much,
Sara

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACD6wFOpQ3ZNBDtPoz%2BLLS57gxAZ3JuDOi_1orGKqPKiC7s4jA%40mail.gmail.com.

--000000000000a3607205e4ee5837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div>I am trying to run jailh=
ouse in a zcu102 board following this tutorial: <br></div><div><a href=3D"h=
ttps://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynq=
mp-zcu102.md">https://github.com/siemens/jailhouse/blob/master/Documentatio=
n/setup-on-zynqmp-zcu102.md</a></div><div>But I am new at this and I have s=
ome troubles. <br></div><div><br></div><div>I have built the petalinux-proj=
ect and also jailhouse.=C2=A0 I have copied into the SD: the image.ub, BOOT=
.BIN, system.dtb, inmate-zynqmp.dtb, zynqmp-zcu102.cell and zynqmp-zcu102-i=
nmate-demo.cell in the BOOT partition and the rootfs.cpio + the lib and usr=
 files installed when jailhouse is compiled in the ROOT partition. I don&#3=
9;t know if something else is required or if something is not needed. <br><=
/div><div><br></div><div>The project is running, but if I do &quot;modprobe=
 jailhouse&quot; it says:</div><div>modprobe: module jailhouse not found in=
 modules.dep</div><div>I think I have followed all the steps of the tutoria=
l. What could be happening?</div><div><br></div><div>Thank you very much,</=
div><div>Sara<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACD6wFOpQ3ZNBDtPoz%2BLLS57gxAZ3JuDOi_1orGKqPKiC7s=
4jA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CACD6wFOpQ3ZNBDtPoz%2BLLS57gxAZ3JuDOi_1or=
GKqPKiC7s4jA%40mail.gmail.com</a>.<br />

--000000000000a3607205e4ee5837--
