Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBBFOXX6KQMGQE7BHAGKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF7550EF9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jun 2022 05:37:59 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id t186-20020a6381c3000000b0040cc5bc8f38sf558195pgd.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jun 2022 20:37:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655696277; cv=pass;
        d=google.com; s=arc-20160816;
        b=eDkGcqhX111z6q7Y4KCf/Z77acyHQ1mzotnfzVMzbYdT3/MXZ3FvEanISNYRi98wCi
         Hgsz634GwTz871lJETcDrCj17A1Z1u8Y91cbInpq2R6WmRFOXhk0RxTgKvT3kxv5DFVZ
         Oioeg5LxLB6huxG0ErSRJ20/+C/JS6gFf+HlrXwtbq2AlW0SoxpO+VFls+4A07Wsa2C/
         KO62OLZxRaiuxr9WFLjP7raN6neXMA4zXbvQfHMT8/WqaakP4lppIuI2OpgNqcPJF3J5
         YKI9ZRA5XenOnio+mdPuTrkTnvWElfJ0c4g4e9AQE/7fUfz033PFsrMSkK6oVcQUqK0f
         HD/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=sHC76y7q4i4u6rV8IZ/S/OglnZwtKFT5ckJgAYERIGM=;
        b=azHEMUkztIAsvCzTPHBDof8/eEhYLXPL10AN9QKDG11U/r3LpjkG+4IRWJBcAn96FN
         No0EQ4/5ulsfcTszWtLinWPdmP/X916nmez2AaK/uTwRGwx3ME+y0SnPIt77iRBaWj4d
         mi+SvDI3pNTg92MLkOZ+Q3Q+u+wI4o8S82NRHQoEQPy3UvUW7E3TjQAiIa3KwLsurmGp
         wjhTeJ1NXh4tMNHrA5O9R6vrtIu3srNUG+4vKVkPdYAkx57FjnJkqGdRaIjlCf9oxctp
         3AAjd7mMk7Ge9kMHN3SNcrtSyS/lmCRIQzC9nFSIPILIiYHqzkzo8a7D5wmlDkONzpPh
         EKsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cEi4zuzg;
       spf=pass (google.com: domain of j.jyaming@gmail.com designates 2607:f8b0:4864:20::642 as permitted sender) smtp.mailfrom=j.jyaming@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sHC76y7q4i4u6rV8IZ/S/OglnZwtKFT5ckJgAYERIGM=;
        b=oAATOTQJ5sPVmG/z3Y6CqlS3Fchkh6Tl/HDlzx9EFK3no60WZ3HDVDJGzzyZ3cn+VQ
         raNbEKSc9XWYV2kamQxjSdpLC2oPySg6x14pUblw12nlioUZUqx5GObsHf2yVdU/5+FS
         z9ab4sxMaJ871M9s9MXTvbB7HjJQnd9kn27sNPYbiPz9wWQ6PXIupXM1tz/d3+897dKv
         +jcQk7f6CKudrp89zvqqbedpfDzkwlpdBORZ8DTv7Yy4qM7DY8yTS4EOHMfRSrUfYohc
         FqEgUYanogiP2gm/oCf8uCHTVL9r2IBVWO4pWid78wZ3fFbvBcSe81SlpUqh98UY+NhL
         54xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sHC76y7q4i4u6rV8IZ/S/OglnZwtKFT5ckJgAYERIGM=;
        b=JIO3n0mz+YKMkcM3tSRYtCdzQ2XQq4Hu02wnuxIbq9ZcpDRK3pRhqF9rhDgD8npswA
         Kew4W0DcooQ2ZYsjIo6QyEfkKTAG+6hbVb8d2G1Ypcr9VAYfpOrOLCRbVM7EuD94iezn
         MdkJZB4+zehTKQDAdq5ZQ5QD/+I3oF+KA3pa3VucHYhv0sJDkD5Cuae/3+v5ldMBiFLS
         SYGjfuuysNI+k1ohN86fSwu8T3pyuh/98GJVzR04kiW+gxDFqm7gV+VUOpcSrlaO8NwH
         UUTxXlI5XftX5LfWnRDGCoVgx+TH3trLwmLVDWHOgdJDlzHVr12UhFTO+dnO0XMKyAi1
         3X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sHC76y7q4i4u6rV8IZ/S/OglnZwtKFT5ckJgAYERIGM=;
        b=A5pVEz+nxlpCMNhkNjtbgZDfMB+ByYPf1mit3uBHNdre8f2W4XsW/ve/s1PH0844OH
         2Aq7qk2zGRgWHl7Gs/JvlJqG8sAxt3k9hoPKq8Q5RfIlNyxypi85bPf6yCAjgh/w4DLl
         hIQ0pgvfUml29ewXJcxYJyO78iSDeOq7jtjjQhOTxPKcN9wUm5qKGaDdfuT4rT9V2tKM
         4L1slnyaXhyyP/TjkVf0yF5zxHKhXDT7u50Jh3C2AuBVnab2aQYdsPrs0XM0SRSWiGo6
         XQkMd3uKy8KWzPzmmTHYijLyAyT1CSvZlXcZoH09opViJ5ZZPZPWbxGBlgPBvqfyVnPD
         MefA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8vjJwFjZKIBJaXwUXnCJGYAOdVGp9dThWI7IPoZe1kxTDAZ+wc
	0WymtQWj4v1euvv4nlOJxo4=
X-Google-Smtp-Source: AGRyM1tXXt5+iNe2nfgkEV/tFB258YQIy86JS72+jq2H7mfJuh4IfgIg/UZWypby4yJsuFnOHR/OBQ==
X-Received: by 2002:a63:3803:0:b0:40c:78a2:75d6 with SMTP id f3-20020a633803000000b0040c78a275d6mr9134901pga.172.1655696277597;
        Sun, 19 Jun 2022 20:37:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e84a:b0:167:8a0f:8d92 with SMTP id
 t10-20020a170902e84a00b001678a0f8d92ls7157020plg.2.gmail; Sun, 19 Jun 2022
 20:37:56 -0700 (PDT)
X-Received: by 2002:a17:903:2ca:b0:156:f1cc:7cb6 with SMTP id s10-20020a17090302ca00b00156f1cc7cb6mr22513291plk.174.1655696276548;
        Sun, 19 Jun 2022 20:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655696276; cv=none;
        d=google.com; s=arc-20160816;
        b=QAwZE7ODnkb7sEChDWd3CLHIMz2HPENi6MDE1nJoqQ3491y3nkz/rDO7uPaqyvvBjm
         BJpoMi17uXO1yCquI/ru/oeGFn/BAUVEYb+QFJY4C61CNiK3qLvj6pCgRIN/hlaK/vI0
         ZEqcylBCEoF5aFBqgL/xIF8gy9J5lk8p+jaa52cYi41pgn6hXCZsLsdUYFqXSeAwvmlU
         rliGUy+0INyuWWx+3OZ5QSj54+riwq9Oheeo5MnSy4A9bSpN1FYYBp6OQmsv1TenKLwQ
         F5tuKbQQi9LOPD7cCSxpiBk5HMCt4GeEilUF7Wz/WlFTHiO0Qirt91loG3qVCLmMPZ0y
         ThIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fMrLq5BPJrcgCuy5DwsmorZ4BfzsHLDsZk+CLfsKomI=;
        b=taNMIN9EJwAhFAf1i4X+VZxu5WufdIVRJpRkdA2C3Fqr/oiJdOyGhyE8okXvw+VHRM
         sogzpyLoI1xX7hX1w+7k8y7A9Aiq0o/oGEtVJJRXK+ARdBlVUqzgZiKEuEHB0OHRyW3M
         o0NDRy2tDzX2uKcn9TLamMRQ63tBq7fu1DZXvAVqtcWGkYCbhv7rZ867R85S+47Bxmbx
         usQL4oCr9yDrvKUjj/I5CztaBpx3jMI5JP7Za6v3Uzv6tTvsxpg7KA7ndLo5LdxXBX4a
         dIhfqAfh6jLAO2pcDjYJiCGPCL6AhRompzEGEIWmBUZ7voegcvwHJGC2xH/gry7Sb60W
         qRtw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cEi4zuzg;
       spf=pass (google.com: domain of j.jyaming@gmail.com designates 2607:f8b0:4864:20::642 as permitted sender) smtp.mailfrom=j.jyaming@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com. [2607:f8b0:4864:20::642])
        by gmr-mx.google.com with ESMTPS id mv19-20020a17090b199300b001eca226859bsi88101pjb.3.2022.06.19.20.37.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 20:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of j.jyaming@gmail.com designates 2607:f8b0:4864:20::642 as permitted sender) client-ip=2607:f8b0:4864:20::642;
Received: by mail-pl1-x642.google.com with SMTP id y6so8620447plg.0
        for <jailhouse-dev@googlegroups.com>; Sun, 19 Jun 2022 20:37:56 -0700 (PDT)
X-Received: by 2002:a17:903:32d2:b0:166:3747:8465 with SMTP id
 i18-20020a17090332d200b0016637478465mr21534668plr.143.1655696275849; Sun, 19
 Jun 2022 20:37:55 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
Date: Mon, 20 Jun 2022 11:37:45 +0800
Message-ID: <CAPiMazYPiRd9OGroHaFv5cNkoaWXZn3eGEjCZGD+oA8a5Lq5sw@mail.gmail.com>
Subject: Inter-communication on Erika and Linux on TX1 platform
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000060c5c605e1d8d4ca"
X-Original-Sender: j.jyaming@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=cEi4zuzg;       spf=pass
 (google.com: domain of j.jyaming@gmail.com designates 2607:f8b0:4864:20::642
 as permitted sender) smtp.mailfrom=j.jyaming@gmail.com;       dmarc=pass
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

--00000000000060c5c605e1d8d4ca
Content-Type: text/plain; charset="UTF-8"

Recently, I used the tutorial provided by jailhouse (
https://www.erika-enterprise.com/wiki/index.php/Nvidia_Jetson_TX1_and_TX2)
to run erika RTOS on the Nvidia Jetson TX1 platform, which has been
successful so far, considering the design of Jailhouse The purpose is to
run high real-time, safety-critical applications. I think it is necessary
to design a communication mechanism between the Linux root cell and the
ERIKA RTOS cell. However, I have not found relevant research. My questions
are as follows:

Q1: Is there any project or literature on communication research between
linux root cell and erika cell?

Q2: I learned that there is an event notification mechanism on Xen that can
help it achieve inter-domain communication. Can a similar mechanism be
implemented on Jailhouse?

Q3: Jailhouse provides an IVSHMEM demo of x86-64 architecture, can I learn
from it and implement it on TX1+ERIKA?

Please forgive me that I'm still a beginner and don't understand Jailhouse
deeply enough.

Thank you in advance,
Jiaming Zhang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAPiMazYPiRd9OGroHaFv5cNkoaWXZn3eGEjCZGD%2BoA8a5Lq5sw%40mail.gmail.com.

--00000000000060c5c605e1d8d4ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Recently, I used the tutorial provided by jailhouse (<a hr=
ef=3D"https://www.erika-enterprise.com/wiki/index.php/Nvidia_Jetson_TX1_and=
_TX2">https://www.erika-enterprise.com/wiki/index.php/Nvidia_Jetson_TX1_and=
_TX2</a>) to run erika RTOS on the Nvidia Jetson TX1 platform, which has be=
en successful so far, considering the design of Jailhouse The purpose is to=
 run high real-time, safety-critical applications. I think it is necessary =
to design a communication mechanism between the Linux root cell and the ERI=
KA RTOS cell. However, I have not found relevant research. My questions are=
 as follows:<br><br>Q1: Is there any project or literature on communication=
 research between linux root cell and erika cell?<br><br>Q2: I learned that=
 there is an event notification mechanism on Xen that can help it achieve i=
nter-domain communication. Can a similar mechanism be implemented on Jailho=
use?<br><br>Q3: Jailhouse provides an IVSHMEM demo of x86-64 architecture, =
can I learn from it and implement it on TX1+ERIKA?<br><br>Please forgive me=
 that I&#39;m still a beginner and don&#39;t understand Jailhouse deeply en=
ough.<br><br>Thank you in advance,<br>Jiaming Zhang<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAPiMazYPiRd9OGroHaFv5cNkoaWXZn3eGEjCZGD%2BoA8a5Lq=
5sw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAPiMazYPiRd9OGroHaFv5cNkoaWXZn3eGEjCZGD%=
2BoA8a5Lq5sw%40mail.gmail.com</a>.<br />

--00000000000060c5c605e1d8d4ca--
