Return-Path: <jailhouse-dev+bncBCYOXD4XX4BRB6PQVKLQMGQE53XJ34A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44C589204
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Aug 2022 20:03:39 +0200 (CEST)
Received: by mail-pj1-x1038.google.com with SMTP id a17-20020a17090abe1100b001f320df2e97sf1476704pjs.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Aug 2022 11:03:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659549818; cv=pass;
        d=google.com; s=arc-20160816;
        b=RqECI4yThDvFFtIbT7obhrUs2XAvNclnAiM/I4SFvKRo1LTENKXLNfHVtCwtcbluSi
         D0Qu/mAHn0WxGtMB40d8X5Ut744Tc0TlXX6jXg9M+hJ59A/nBc3J7BDAjlY/z/y2uIVL
         McoG/4S4FCMPm+UGXYgxlYheS1hdrtm+/tu3NelCaSLnqloJHjnwTREVTQQG3H0O1A8B
         PAZeUOHzZnXrx79vUJWa9n9ztS/zHEsOY/TOqLVdlUFGhZF0UeWr0dSKmnWPlm6uQc/k
         MbClWCNJAGF5NJS6rb9bGFT7j3orzTCs98RvAj6h8GGcm0+sB8B/CI8bzfd2Sb4DMyVA
         cNIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:mime-version:subject
         :message-id:reply-to:from:date:dkim-signature;
        bh=U3I2YxI6jXdZ53AoHH2sBLotz861gPVgPDISzXFJ3e0=;
        b=fBWXNFsaoeHBV+Bb4WhyC4Le89xHG0KnUdezlXDQFcSzbWUjulWdvmXSE0g57ExJCm
         lEkRCe2DOEGBaMf7wioAs1C2PwNchxjEcS5hM0fSHI4WLHBl8ApyUsWbPMFGxeHGvcNr
         N7AugPOy+n0xD0LAKTAdGq6U/LmAvwzfhI8b9+wCiNOxfK1h0xaJ0XxJ6DHQaeEmw4k2
         1IxauoJV8ofR12AVM/VjBVjOjd260HjlC8SiybiNY3nQZ7jUlePbuOhS8d4dB2mwlmyE
         b8T4iHFYQgEm2sxODVV3xqJzpADrD4YEI+YHNiq3rkj7gEU72gVprA8795A6gpy1Zbyn
         2uSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@aol.com header.s=a2048 header.b=igr1cW7F;
       spf=pass (google.com: domain of gasparjob@aol.com designates 66.163.186.205 as permitted sender) smtp.mailfrom=gasparjob@aol.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=aol.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=date:from:reply-to:message-id:subject:mime-version:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U3I2YxI6jXdZ53AoHH2sBLotz861gPVgPDISzXFJ3e0=;
        b=nfNOXf5NoGoN8Fzta6Z45XexS+EKSin3I/s7vJVyQ+aIgoitVAVwnLW0r0oIy+QdA/
         8ILsGNamHFlCGwuj6SQol4MlstelXT2LtbFOG7Gqdlke1euy/bweRpBo6ajpG6tgRdIG
         zzgyjy4FjtPUgo6/XjDtMxi7oAeXjYa3uEZ/ELus9JGawkYmP4XFrCZ8J9xZIaqvuyxO
         FfOIvGeiO59b1C7FklzPKsKvIraMXPRIfosFwKFvJJutO01rlajpa5PPSdyEwN7s1/xp
         B0JhNxX6nroRZclswBznOXWZpa3FG3Hn/9WSboUiVWiZAO9DjpiohIH/PmjckFr/izlh
         qZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:reply-to:message-id:subject
         :mime-version:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U3I2YxI6jXdZ53AoHH2sBLotz861gPVgPDISzXFJ3e0=;
        b=J+Bo0LoQQpAQXRpjUzTWCAQ3mquqBWNN23BwKNDaafcP+1vTeEnoeC3iL02VhlwhtK
         UwCbyKV4jkaSx+R6K8k/UnxAkHeav//Mia+ajNBR6iqAEqnzZ0UiHAJ1QKIPWMiDpo4B
         Ha189FUPcCXqWpNmHZvitP8wB2OQXtPcRuMMef3qscqSOyy40N7Xm6vUvoC2S/yfhjaE
         fubUNbLdUd/e0Yrgm6rhfVG34MuWaJ70xf8iUGhbWHlzcxchx+xyVfkQzA8cgti2NpOw
         mdDKaBP9m4Ux0ojrWhZSWESbLjjbPHxTnzL3ocWs8etB/QKjnBW1Hj0M9iO6vbEK+tyM
         RRQg==
X-Gm-Message-State: ACgBeo1SbWCRwkfk2PD8731W0krfjKXi483DHMWYC1pRSKf+MWSbbKeN
	BC4D1TmkiwR5H12TLnd6lJA=
X-Google-Smtp-Source: AA6agR4w5kqT9hjZEOrARc2IvOB4vdQUf4WHQzmgAuzg8vqfqdkGu/3NZufN9ZAUzFbIJhK13EM8Vg==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id z4-20020a170902ccc400b001565d37b42fmr27343945ple.157.1659549818500;
        Wed, 03 Aug 2022 11:03:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:83c1:0:b0:41b:c89f:182f with SMTP id h184-20020a6383c1000000b0041bc89f182fls4579737pge.10.-pod-prod-gmail;
 Wed, 03 Aug 2022 11:03:37 -0700 (PDT)
X-Received: by 2002:a63:8548:0:b0:41b:f048:1761 with SMTP id u69-20020a638548000000b0041bf0481761mr15089410pgd.10.1659549817165;
        Wed, 03 Aug 2022 11:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659549817; cv=none;
        d=google.com; s=arc-20160816;
        b=1EL8MNAPGwIQQHRBufm45pjwAnc1QgGn3qngNwSCVUoREwfRPbdJ+oSnRp83qOqaYs
         Lo8TgCOHIvYSg4GI0wzP2GKfrBld3Yic5eZKsBTECamvVHrIK2sUn0O+yltHgGq/+LGF
         MY9w/umoZ2xo9/9HLlLAD8QiEREImOgq0gXlxUEFXbRv96mIofTjY5qGrbiFijmerQhu
         3sbFJCxnV4ZtyYvuWW5YBVHvfCQbZULVJ1jk6Sgh5b13J/LrujC56VrH8NB4tgFsTjUE
         LjO//yec590risQRgRTmsiEz3W3oH5k4nilVrkYWF8pvUia3ByO78o7hKRfsNM7npYQr
         lR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:mime-version:subject:message-id:reply-to:from:date
         :dkim-signature;
        bh=SqffRLHKxniEeVyCZC4I5JaGmYDQ1iFM0+Qj3gnlJZ4=;
        b=XNYCGXKfOX6L3J93xzDMj+FtlzFYzOlqp3WYNJ9ruEKUN4tMfPESk+aUmRI4czta0f
         vtIifvTUc2fC8p/NY6mFtFRLDQiuA9YwhF78V75nEHPiNrWaj7PmFqtddnma3oLJeD5R
         EeKmGAVV7HiuKLBYaCIhRGV9Ki4B0xUhR+ZU+bwXG42iy/R75iV2gSoCT7BtP0F0WMgg
         Wn/rOdcWUq/hu44xJW5pnyKMIBiWeI8y0HuCEvpwRwzv4xMo+s+RJoe/YZ7W7Xkpvmrj
         uWLsDdOEU1XNDWdm+yXkALrKn2lylRXfLtUiyDHNM9VfibAq09ZcGAOC+CcxYv4K55dm
         Dc4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@aol.com header.s=a2048 header.b=igr1cW7F;
       spf=pass (google.com: domain of gasparjob@aol.com designates 66.163.186.205 as permitted sender) smtp.mailfrom=gasparjob@aol.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=aol.com
Received: from sonic310-24.consmr.mail.ne1.yahoo.com (sonic310-24.consmr.mail.ne1.yahoo.com. [66.163.186.205])
        by gmr-mx.google.com with ESMTPS id q23-20020a656a97000000b0041bc385c599si376818pgu.2.2022.08.03.11.03.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 11:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gasparjob@aol.com designates 66.163.186.205 as permitted sender) client-ip=66.163.186.205;
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1659549816; bh=qVeqcY/n0GmiR5szVJapg7/z8OQosE8c2FQ6MaxqTvp=; h=X-Sonic-MF:Date:From:Subject:From:Subject; b=AG6y/GKWB9ZazPMSwxb/5TVjwaZxuKEPSDWtBLVf6CVP1WCmcuTkZsYrc19JHIC5m8ySv9tFCVKBW8TcJYbgEGM341i9AIjQcziu0f1Jz/L9/lBHC+KZeZ921lqQEPgvGa/XHZS1oRMmoYVA00UWvRqaEFrhxwcqEVlBbElm2f1h06ijc5ItdxNiMZyil1nSDrC4sllcZchKL3lUNwgVi6V66MlleDWH1AZvC0pHjlTLsFKyMaJz7KRVuKiJOMU0OQPFubKw0ld9mL0ULmei7nd01CJpS6Qz9vae7o1mnfyuwogZGPvriIou8Lf0MsNhIDkjiQuFGFu1+5aJJZqreQ==
X-YMail-OSG: CtGvEg4VM1ntvf5uVEhK1auhK4tEw.RDI14lS9vzdcEPwOGRAGj6CfQQiyPIxPw
 uwzeeVTPpF3llSS2q8XM9ugNoDmU3tUUbNr6x3XK1GpLBbhcrAEZ3ap79UZip63zh1PGn3KUhPIs
 .cdEY1J2omnUJJulpsRX_jT.oFAXXO.MD.cEPUmUAyR51X8GsqMokSgX5ZsZ9KAlXxizkJlzDCLn
 0jARWDhkOG7Hz_FUaSz2ytwoYWHsPZBhljAtkDLmSc5Bba_z8wsb4ZHbKBRLpelqnFfrQiDv.fxQ
 WVv4lBcSXI7QxEzfLHSBS8hbf7Xq_4dTLhBcG.MxPuFgz25wyvwhH8cUl2ZP0_AluaNz1bqt_THD
 F7.zuIcHEHE2tR_vClwaPfqIecBPCajpOczFrVzb5MiDpmlkWDwlplffSvoARyynYgvn8rWAOm79
 iQE59JNvege9sktaCJEP8BC6nNY3wVR8aTLaV7EtHYxTN8rEMM7g4mxUELAdtvPxrlw9EMd59PYA
 7RHg.181lESHp0N0jy3tkpME2bYJyLagOv61_T.OjU.332D9Q4AYgY5tDYjxtZygN_2pMiQfgXy6
 .jw8CegqKmiK.e7a9koYjUydUIqqjKYh4IK_JILzsqKjk0TDA81RBIqvW3RKYHH_iVvDbsIBBro8
 EVz6w3p1RdZoUiua3GmNJjZDoNNcmavv3ODVUdrFhmlAl1fq3WYL.4XRvsZ_gV8xmmOGMtoF9NBT
 GGuBZPCohYaYE9SCeECcHjMi5V7V1BsnffLI7.BaHnlisLh2PETN7AzZPrnzS.J.WY9GlLLFD27O
 UCaVRrsBt7XiA02i8BLevfaBk5_bhkerjySmRW0L30j3IHGsG0Q3CR10263Y8BIbceJUDPEE0DbE
 5WP0Bqnkfvv6XDZeu2XHl_OGqvlJaBFuveO_92WRuLA9LBdM7tYJoFSlGOz3TXeWTN58uu__zLSR
 JdP.9nMhvxfy1kouqnB2t51BnvnH_xRQ7z7ehMG_ln3bAWfMexwSLsCR2C7QpFhtgyh9.FW.oA22
 eLnSPKh_CICnUs0A2uELMuciA06n23Y9AfTeSDvTt4lRp8LQTqDqExYUQ1Am7ilxypMmxzzdYyr9
 giAJ4hI.l6XIakwH9bLh04sJGPJ7.DioEvWm2UUUp.9ltL4ETtBciOvZiv1Xd8BrMS1BjA8JoN4p
 OmelImQIh3SraZwdat_BHc6O0l4MMGIs_zHJKAVkCdzXJWKi8oIklhPnjmhgYaJx3oWMshfAEK0J
 gVh1ymZw2iJbKfu.ldxRbqJAafcMEgh9Xj8mvLJDus_jO8hZPNCRy2hQ3NaeCZcBTjJn58n3EQbW
 URuw4VcDXvJcrtE3AaKz4DEsVHKfurWECYys2SJyoWvk6NpRMZ3OcwL4TNSfjDfAi8TPyvFMfybr
 Z9T4hLDdLJLVc2jrRyvzzkpswGpFbNvyvPBfPs7xv5UQMLP7HIfBcJ5ryLBxonCX.XTeHcVMBLcG
 D_kIYJ_FL_Yk92eqBDW3yUpUpBrVx9xYJt6TmtbvSXvhagIhCKvH3DB4vwxn1pjOiABAKdzTEAIY
 fRdma8v6LOGlq2MFQhblGj30v6pokkdZCjh4d6XBOEP0PtOK0KKX0QLLMv.XnnbzPQlURS2dZiM7
 9FNjTpkTUSyWh0PPBuaM3ud7gPjc90ICMbPf7dNLkccVNNvIxO.HHRueLOUET4GJTRncbwUwfL5B
 gQkPX9ef4AxlY2ExfAw6YjkDCTqGey0TdQ_12JRZXFblqi6XvehFVDVA_N_1qJa9nnbqecwNUIdt
 lHearKbhub4vxCcogu14zSPShA2VPOk6zbv5r7N8aIbVUF3won8cm7GMzfbkWByYPoTyj7C7o5xU
 LkgPPyx4uE6rtmezMBT7St.4riRMJWV_U_l7WfZ0Y5IVxvmm5RuqRaGyp0YcgqjW.2P9aDMzTNA4
 x3E5_Sk8beSajXfZkSx1k1C.4SChGvk_d9LHB6VqHx0dvmbIYggqp2EzqxBMELsVHiA2FmuefXhI
 fOvnNZnKzkfR.ptaTH_qfoatXV7mchb71M2CBYaGF6EvkVmyw7TtIaFxzjiF7K7vYf2pDhw7owBm
 PPmw7dcQc3plCc.QMettFYXzJxe5s6AYc8_cbmrvH5qis67V0ZOVQxKn2vquLPQ2JxUAmQkWcjgf
 v2xlSgX1bqYtgzlHmhug67vL6.MJRP0TOgBlUX_gl9RXKEA--
X-Sonic-MF: <gasparjob@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 3 Aug 2022 18:03:36 +0000
Date: Wed, 3 Aug 2022 18:03:35 +0000 (UTC)
From: "'WORLD BANK' via Jailhouse" <jailhouse-dev@googlegroups.com>
Reply-To: WORLD BANK <gasparjob@aol.com>
Message-ID: <858865205.381748.1659549815625@mail.yahoo.com>
Subject: ATM Visa/Master Card
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_381747_2074810525.1659549815624"
References: <858865205.381748.1659549815625.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20491 aolwebmail
X-Original-Sender: gasparjob@aol.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@aol.com header.s=a2048 header.b=igr1cW7F;       spf=pass
 (google.com: domain of gasparjob@aol.com designates 66.163.186.205 as
 permitted sender) smtp.mailfrom=gasparjob@aol.com;       dmarc=pass (p=REJECT
 sp=REJECT dis=NONE) header.from=aol.com
X-Original-From: WORLD BANK <gasparjob@aol.com>
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

------=_Part_381747_2074810525.1659549815624
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Attention=C2=A0=20

=C2=A0How are you doing, hoping all is well with you and your family? We kn=
ow you might have forgotten about this outstanding compensation payment due=
 to a delay in the delivery up till now. We are hereby writing to inform yo=
u that your payment file was found in our office and we discovered that you=
r Compensation payment worth the sum of one million two hundred thousand Un=
ited States Dollars {$120,000,000.00} have not been sent to you as it was i=
nstructed by The Economic Community of West African States(ECO-WAS) We are =
here to inform you that your payment has been converted into ATM Visa/Maste=
r Card to free it from Confiscating, and all necessary arrangement your ATM=
 VISA/MASTER CARD Payment worth of {$120,000,000.00} has been granted for y=
our payment through Our ATM Card Department Center.

Now Your ATM Visa/Master Card is well packaged with every legal document to=
 convey it not having any problem with anybody therefore we are hereby invi=
ting you to our office here in Benin, Office Address, Commented Bank, Coton=
ou Jean-Paul 1BP 325, Benin Republic, to enable us to complete the normal f=
ormalities and activation process of your ATM Visa Card and issue the Secre=
t PIN CODE/NUMBER to enable you to start using it at any ATM MACHINE worldw=
ide of your choice nearest to you, as soon as it is activated, But if you a=
re unable to come down here in our office in person you will be required to=
 update our ATM Department Center with your contact delivery details as sta=
ted below so that they will proceed with the necessary arrangement for the =
delivery your ATM VISA/MASTER CARD.

You're Full Name=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cell Phone Number=3D=3D=3D=3D=3D=3D=3D
WhatsApp Number=3D=3D=3D=3D=3D=3D=3D=3D=3D
Your Company names=3D=3D=3D=3D=3D=3D
Current Home Address=3D=3D=3D=3D
OCCUPATION=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Fax Number=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Country=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
City=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Nearest Airport =3D=3D=3D=3D=3D=3D=3D=3D
Next Of Kin Name=3D=3D=3D=3D=3D=3D=3D=3D
Next Email Address=3D=3D=3D=3D=3D=3D
NEXT CELL PHONE=3D=3D=3D=3D=3D=3D=3D=3D=3D
ANNUAL INCOME=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Tony Elumelu
Chairman of Heirs Holdings, the United Bank for Africa
Email:=C2=A0tonyelumeluchairman@accountant.com

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/858865205.381748.1659549815625%40mail.yahoo.com.

------=_Part_381747_2074810525.1659549815624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<div style=3D"color:black;font: 10pt Arial, Helvetica, sans-serif;">
<div dir=3D"ltr" class=3D"gmail_attr"><b>Attention&nbsp; <br>
</b></div>
<b><br>
&nbsp;How
 are you doing, hoping all is well with you and your family? We know you
 might have forgotten about this outstanding compensation payment due to
 a delay in the delivery up till now. We are hereby writing to inform=20
you that your payment file was found in our office and we discovered=20
that your Compensation payment worth the sum of one million two hundred=20
thousand United States Dollars {$120,000,000.00} have not been sent to=20
you as it was instructed by The Economic Community of West African=20
States(ECO-WAS) We are here to inform you that your payment has been=20
converted into ATM Visa/Master Card to free it from Confiscating, and=20
all necessary arrangement your ATM VISA/MASTER CARD Payment worth of=20
{$120,000,000.00} has been granted for your payment through Our ATM Card
 Department Center.<br>
<br>
Now Your ATM Visa/Master Card is well=20
packaged with every legal document to convey it not having any problem=20
with anybody therefore we are hereby inviting you to our office here in=20
Benin, Office Address, Commented Bank, Cotonou Jean-Paul 1BP 325, Benin=20
Republic, to enable us to complete the normal formalities and activation
 process of your ATM Visa Card and issue the Secret PIN CODE/NUMBER to=20
enable you to start using it at any ATM MACHINE worldwide of your choice
 nearest to you, as soon as it is activated, But if you are unable to=20
come down here in our office in person you will be required to update=20
our ATM Department Center with your contact delivery details as stated=20
below so that they will proceed with the necessary arrangement for the=20
delivery your ATM VISA/MASTER CARD.<br>
<br>
You're Full Name=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Cell Phone Number=3D=3D=3D=3D=3D=3D=3D<br>
WhatsApp Number=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Your Company names=3D=3D=3D=3D=3D=3D<br>
Current Home Address=3D=3D=3D=3D<br>
OCCUPATION=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Fax Number=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Country=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
City=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Nearest Airport =3D=3D=3D=3D=3D=3D=3D=3D<br>
Next Of Kin Name=3D=3D=3D=3D=3D=3D=3D=3D<br>
Next Email Address=3D=3D=3D=3D=3D=3D<br>
NEXT CELL PHONE=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
ANNUAL INCOME=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<span><font color=3D"#888888"=
><br>
<br>
Tony Elumelu<br>
Chairman of Heirs Holdings, the United Bank for Africa<br>
Email:&nbsp;<a href=3D"mailto:tonyelumeluchairman@accountant.com" rel=3D"no=
referrer noreferrer noreferrer noreferrer noreferrer noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">tonyelumeluchairman@<wbr>accountan=
t.com</a></font></span></b></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/858865205.381748.1659549815625%40mail.yahoo.com?ut=
m_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jai=
lhouse-dev/858865205.381748.1659549815625%40mail.yahoo.com</a>.<br />

------=_Part_381747_2074810525.1659549815624--
