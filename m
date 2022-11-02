Return-Path: <jailhouse-dev+bncBCP3NC7J64FRBWUORGNQMGQEYXXWEDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 082016160D5
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Nov 2022 11:32:59 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id y20-20020a056402271400b004630f3a32c3sf7274350edd.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Nov 2022 03:32:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1667385178; cv=pass;
        d=google.com; s=arc-20160816;
        b=ldRnc8EJhMStvFkVKa2HlEwd0APDnJY3NTbuFKY6hMDSFhIfwK5yhNTGzcqW4oIXeE
         5oVnhxRMHOGWjURK49EibpEm+Aq3ylRGONzKi700JwFfCgXRUqVc0A6BeiaByoz7/9w0
         dKsLXh7yihEDjekHxTqV3hQkB/F7PuyHGrSpXLV4CpbHwNdjiWfaR6zZLqxyHQdSV9cb
         Bmg++I/00sWyWod90ZXW+3s3/PYCwVLPsjjY8E4Oz+f8JD+2bhneyNNd9Ef/LKf6ZGP+
         GlLjJm2C4Kx1rT+0ifAQbu0SkdjZDI/w0i/5k8BNc8Xymy5UUR4zyrPKqjv/gter15c+
         pysg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=0NsLW3n/0M9DV3iMFN1dNZsIV7eV3G/uvxce+mtRk1A=;
        b=CKyOj1IxZ79bVkZgpjosSUSPJopR+nQ3ob6xu35Q6hZazfYWHA4YxB9LtM+VRKOnNB
         NdVVyc9jdXmlgZ2rgjqXF8IzP5ye0T3mrhhHFBWXhtN6pGLmtZmaZj56jOUWRHH564dp
         cR5U3JSZ36H17PsfeWCVdW8bgzYsir1WoqGaxZzk95BevKl+6lmVVLTyDFrNGBrdPOoB
         brMi7kr7U6vsP7FcanAxbUoM8NVrU/sSAZI39a6Jrq2HyA6NmNB87Ygndh081LPPdC1g
         avHum/lvvOtnx7lXdPGQ0+2y5DwgK8tR/buzgLKVelMy70uQM6TsNBNsjULZDXMiknYs
         O6oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFDN8Qra;
       spf=pass (google.com: domain of gl9700183@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=gl9700183@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0NsLW3n/0M9DV3iMFN1dNZsIV7eV3G/uvxce+mtRk1A=;
        b=Tm90rFSzNSh+OhnmXkaZkS3nnZF4zZM4l2LOSf2FTw3kH6x5EPY89bW/yVv/D/YrKX
         bz/TdDF9YNzMFXAOyuEzTsOwyqXECcEHI6OAHruOARHiZj/QJdB2txyDIrA0SskcpWul
         GiWn1+rrdOHtBYl+1ybp2OpmG7Kf4QMRfto647w2wu2iyK9vzbU4PFshiiRAxNRDr0+a
         U/W3ky7tSlEMROCm5OQeoQBaYqJSQfn1sikPEhJsydRGMWpps5ZQwujrEbyRldO6+u4U
         POD2hAQq1VwUBhc4uURHkNKEBPV6Mzswbv8lMOQ2L1vsRcqqNwz5AgUzuRT8TuSLN6C8
         eqkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0NsLW3n/0M9DV3iMFN1dNZsIV7eV3G/uvxce+mtRk1A=;
        b=T06y5H5Ufjc+p3InZSvZuQicD6PHMcocx1Sz/JsdyqATAGoKUNBHFZ4ASb51OG4t7V
         lzJX5dHgkpISqJqzHCYfV75tak7VsKppjh2AOEER4QlTtXQgLF10TEcKD4SLozEACIah
         d9v66LMfNlezoRH1yOcydtlV1N5ZsGF/UVGlTVTarqWoWgKcsBS5NNtivbMCz1Qo+cDv
         KqpTuth++DabepRWfoEvkDekcUgiBtgVJtlY2QrEuSoc3rFloxyWSlgaR8sqXYJktJOp
         hMo2Bj5Ye504hpV0XdhZkw0WmY2kIj5veuE2qED8x66AbHnKnf58grSui6iYvLVFhHCx
         QMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NsLW3n/0M9DV3iMFN1dNZsIV7eV3G/uvxce+mtRk1A=;
        b=OENLYjaJUwN3dDasDAH0+WPh+XZT5r+jWm0+yqCpZxGmKhJeSIBy3FOZOxWRvObxzY
         D5iSkUHf6TQuAlPSPnKmUzlMz8INakX6eD6Fx6Mocw99fYQkP4VW9nZnniSny9518ZjJ
         +6VD6h4AAUaQRN9Y3L6/T0W8LxSts3doHKRzMVJTHHkRvU0bli0obNfz3ObXa8zrAjKv
         Gns129/TdubqXM5m2UMQQBK5amTjtMqrrh4Ovx2Bwwfmko2QINmIzlg6BbfpjVZAwgfD
         V58RQM46EAGFBkCHvCiXnzdVONRt16M4JfghCjYnF7OF43TQJzjLtg1L7G0DRbd5XR3A
         pxyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1EwIpMsQ940a+yURp3Oa8tVMGAbjnbWTjs2EV8RYo17GYc7R82
	Yk3gkEPEcjw7ODuXMj+/G9o=
X-Google-Smtp-Source: AMsMyM5mfFu8ViEHUSH6XcvF8SSRlHN3tPG2pCdBPfJWa0P4EeDVeWyIkWt6fpYj0DdT3oi979MC5g==
X-Received: by 2002:a17:907:7f25:b0:7aa:acf9:c07e with SMTP id qf37-20020a1709077f2500b007aaacf9c07emr22821117ejc.280.1667385178758;
        Wed, 02 Nov 2022 03:32:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1e16:b0:7ad:934f:14b9 with SMTP id
 g22-20020a1709061e1600b007ad934f14b9ls8216823ejj.9.-pod-prod-gmail; Wed, 02
 Nov 2022 03:32:57 -0700 (PDT)
X-Received: by 2002:a17:906:5dcc:b0:78d:e76a:ef23 with SMTP id p12-20020a1709065dcc00b0078de76aef23mr22132462ejv.317.1667385176984;
        Wed, 02 Nov 2022 03:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667385176; cv=none;
        d=google.com; s=arc-20160816;
        b=A+jJ5RnSgDLVsLotwN6AHAN9MYWXYNxrMW4arQy11PdNG9CX9L2zSDCPRCBqBQxx/t
         I/6oVHDj/Zvjmc1ynxQJJWfH4vFIXaYC2j/uzKh97nwyES6ut7G5C1MvifC2HQq+cmOe
         YlnI2+44XOiZEApepo48qeWqf61fQIMLF0W5BzM6Oz2GItnT2Pb0CQv+DEM+/GiVJpXI
         IAv2ZmDiNMILBGU6oEXp/bqiWXsK93991fvsmZ1eFvRuR5v5gwstoUB8Bok/vis/vZCY
         uSbLR7L4iRzxpkMNYykbwekt1a5icD29zq+Vhxvttr/wbIK5O/j3SA8aAGECTj53+eG9
         MJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N9dRm0mXQQnNAYU/uXGoBzHNa73ABtKgBkJa7Ph5YLE=;
        b=onIbWIxZKo0PoTc7mzZma4lIWv9MC02KBfNDSQWJiaWdFWIdHTEhe3DYRye5bOZPO7
         0urE9j+EN6urE0zL1apgvQJRlhqhGkAbKFDxMusApzfK9kr4JcYyOwKx7pNQvyXarH9Q
         nI+usqWhT14LEFbyGGugNLU5hmo6UAjgtcLG3zXl34x1OtgRoyyGAkyzWI+u0m+jL8Tf
         RxlYvY1nR2sZFXzBOEnX22eC7w/ePeowC3rbE2GT0iu+8Fl97s7YknhK/VPzmhFyi1hF
         A+xnczgc7WNlchGKMlgROmsTcyZM8BKCCv/ZM9l9z5LJ5MiUpyQP5XQ+U5vcWgtUve58
         083w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFDN8Qra;
       spf=pass (google.com: domain of gl9700183@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=gl9700183@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com. [2a00:1450:4864:20::541])
        by gmr-mx.google.com with ESMTPS id my15-20020a1709065a4f00b007a5f25d9f11si409143ejc.1.2022.11.02.03.32.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of gl9700183@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) client-ip=2a00:1450:4864:20::541;
Received: by mail-ed1-x541.google.com with SMTP id v17so2074443edc.8
        for <jailhouse-dev@googlegroups.com>; Wed, 02 Nov 2022 03:32:56 -0700 (PDT)
X-Received: by 2002:aa7:de81:0:b0:461:2122:a807 with SMTP id
 j1-20020aa7de81000000b004612122a807mr24391954edv.382.1667385176742; Wed, 02
 Nov 2022 03:32:56 -0700 (PDT)
MIME-Version: 1.0
From: "Mrs. Johanna Maaly Bob" <johannamaalybob01@gmail.com>
Date: Wed, 2 Nov 2022 10:32:36 +0000
Message-ID: <CACU_cZ_e3KKJer2Suf=+=x6j0-M1jfomALwQZgLGcxpVozB_dw@mail.gmail.com>
Subject: Hello Dear,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000029df3005ec7a5d7b"
X-Original-Sender: johannamaalybob01@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=YFDN8Qra;       spf=pass
 (google.com: domain of gl9700183@gmail.com designates 2a00:1450:4864:20::541
 as permitted sender) smtp.mailfrom=gl9700183@gmail.com;       dmarc=pass
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

--00000000000029df3005ec7a5d7b
Content-Type: text/plain; charset="UTF-8"

Hello Dear, I was wondering if you received my email a couple of Days ago?
I would like to have a personal discussion with you. Please give me a quick
reply.
Yours sincerely,
Mrs. Johanna Maaly Bob,

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACU_cZ_e3KKJer2Suf%3D%2B%3Dx6j0-M1jfomALwQZgLGcxpVozB_dw%40mail.gmail.com.

--00000000000029df3005ec7a5d7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Dear, I was wondering if you received my email a cou=
ple of Days ago?=C2=A0 I would like to have a personal discussion with you.=
 Please give me a quick reply.<br>Yours sincerely,<br>Mrs. Johanna Maaly Bo=
b,<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACU_cZ_e3KKJer2Suf%3D%2B%3Dx6j0-M1jfomALwQZgLGcxp=
VozB_dw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CACU_cZ_e3KKJer2Suf%3D%2B%3Dx6j0-M1jf=
omALwQZgLGcxpVozB_dw%40mail.gmail.com</a>.<br />

--00000000000029df3005ec7a5d7b--
