Return-Path: <jailhouse-dev+bncBCTZ5DX32QCBBXWUYGNAMGQEG4SUV4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A96051E5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Oct 2022 23:21:48 +0200 (CEST)
Received: by mail-pj1-x103e.google.com with SMTP id r12-20020a17090a690c00b00210c64e3e1csf519641pjj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Oct 2022 14:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou7Ghucj2K22OCqunrhcoTf9hPkdkgwOznam2dOCXPg=;
        b=GLNkJI3IVdZOLxonODziWKHDmiahUXGToleZcnbh3is5Jl1ZzGVWiE/J19UZX3omUj
         rawPVtBdukVDz7QMuqX6/OngTmOzb8oMjpnrIztaS12osp9jesBgx07YuWrNV0wVjj/c
         R4JoPwb/GPkJOBpEpaU01q+MTWGx8gOS4Y+9vOoCkmTFfSmDEgkr+UfUPrW3rDMD0KJK
         q87AO81hZN2kg2FSjeRX6MU3ltxQ2IyHVJYQV7EFUhxNiMQ0MiHZa5QjRfPpCO7CPMpX
         rqsSznv+JN+cIpr33ucFZj92BthU5pry+TgHbkysnp36kltDBg4e+tv8zLkuHtOb56jL
         889g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou7Ghucj2K22OCqunrhcoTf9hPkdkgwOznam2dOCXPg=;
        b=fZo74cera8hIPDbRJzZKRlYo66kK+J7EgssQzRZy+kwjGAccXYFMNA8C1t8SF0SnlW
         ND6iAuVMV1dM5WfVI2dC9IqOAuJTAkvEprauaO797dqeTDKdTKLPEm8wnVVNs7XFDiju
         WC3/E/vtvdrzTLPFCuYWUUwwmNwRZdTbGl9vDZqsMaz/f3dDu+eFLJXHduylW1UQOY4V
         GOO9DpSxfl8pbGGUjDTBk40NlpKz7F8k04USCd2w89UCvG7AfLvznfTpf37ds9/bsDgr
         gwQbeDYxSf9HEoJoahmdpK8cWNlEKFRI1QEnx1kQUcptgoVDR39iVxq/yjj4GeIOEpw5
         CtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou7Ghucj2K22OCqunrhcoTf9hPkdkgwOznam2dOCXPg=;
        b=I1dFnJ0G25hYXRNg4pOebhdMwjYRcZan+8ZzMVvXs72yruE4sIDJEsstlCLGQo5XRh
         aEyJYLuRpHZisn7+D/lFpXGeIlYtRcQMboq/iwr07EYAE1+jgMgjeV6A7sko11nCxuME
         q1ldzbMUCwSxcEQ9gBclXegXZRvL2QUDTefwcK8ysKfapJpWLMSzkIASG2sCfWfylfSn
         XCA/xVKm+XiinIU9FrTqx+OrSGUCvTm4iooVqEM/oSC5KP+Rb5cubeEwuF0DB5C/Hcx4
         I0TTsAwJX3AzqcFftXlEKRbWWPngpR+y4NXxQBo2DTjtWS0U2Y0ON1Pw+fLVqHnECBIn
         xDzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0gDzHtsMVxG8dGQWXw4AvJ9gmgnutH0eEOrS1Dt81FK2RfdtuG
	NtX/DvLQQfSBiSWIYvLTZnE=
X-Google-Smtp-Source: AMsMyM45hwPD+7GB0gDXdYSdPMuEu2h0+/JcwlVtq5+xuLPFXyGBZyLDdfLKXmvULfSryJFt+dMGUw==
X-Received: by 2002:ad4:5b8b:0:b0:4b3:f368:de23 with SMTP id 11-20020ad45b8b000000b004b3f368de23mr8283842qvp.73.1666214494821;
        Wed, 19 Oct 2022 14:21:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:9e99:0:b0:4b3:fc03:b22d with SMTP id r25-20020a0c9e99000000b004b3fc03b22dls9263710qvd.5.-pod-prod-gmail;
 Wed, 19 Oct 2022 14:21:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:4b8:2025:5f6e with SMTP id gg8-20020a056214252800b004b820255f6emr66670qvb.88.1666214493870;
        Wed, 19 Oct 2022 14:21:33 -0700 (PDT)
Date: Wed, 19 Oct 2022 14:21:32 -0700 (PDT)
From: Lukas Saintz <lukas.saintz.92@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n@googlegroups.com>
Subject: Running IVSHMEM-DEMO on BananaPi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5168_990264135.1666214492998"
X-Original-Sender: lukas.saintz.92@gmail.com
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

------=_Part_5168_990264135.1666214492998
Content-Type: multipart/alternative; 
	boundary="----=_Part_5169_1751555235.1666214492998"

------=_Part_5169_1751555235.1666214492998
Content-Type: text/plain; charset="UTF-8"

Hi Jan,
I'm studying Jailhouse Hypervisor and its implementation on a BananPi  M1 
Board.
Following your guide I've successfully compiled and executed both 
Bananapi.cell and FreeRTOS-demo.cell.
Now I want to study IVSHEMEM and how the two cells can properly communicate.
The only think that I can find is a ivshemem-demo.c with pci device that 
unfortunately when I do the commands "jailhouse cell load FreeRTOS 
/jailhouse/inmates/demos/arm/ivshmem-dem.bin " and "jailhouse cell start 
FreeRTOS" results in a fail of the FreeRTOS cell.
I can't find good documentations on how to use and implement a correct 
communication for my configuration.

Can you help me? 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n%40googlegroups.com.

------=_Part_5169_1751555235.1666214492998
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,<div>I'm studying Jailhouse Hypervisor and its implementation on a B=
ananPi&nbsp; M1 Board.<br><div>Following your guide I've successfully compi=
led and executed both Bananapi.cell and FreeRTOS-demo.cell.</div></div><div=
>Now I want to study IVSHEMEM and how the two cells can properly communicat=
e.</div><div>The only think that I can find is a ivshemem-demo.c with pci d=
evice that unfortunately when I do the commands "jailhouse cell load FreeRT=
OS /jailhouse/inmates/demos/arm/ivshmem-dem.bin " and "jailhouse cell start=
 FreeRTOS" results in a fail of the FreeRTOS cell.</div><div>I can't find g=
ood documentations on how to use and implement a correct communication for =
my configuration.</div><div><br></div><div>Can you help me?&nbsp;</div><div=
><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7668f20d-2718-4cfa-b7c7-6b17ac1f2c19n%40googlegroups.co=
m</a>.<br />

------=_Part_5169_1751555235.1666214492998--

------=_Part_5168_990264135.1666214492998--
