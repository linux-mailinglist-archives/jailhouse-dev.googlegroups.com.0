Return-Path: <jailhouse-dev+bncBAABBP7A5KBQMGQEACJTC5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B592362F13
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:54:08 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id e4-20020a2e98440000b02900bdeea8afa4sf3738559ljj.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:54:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618653247; cv=pass;
        d=google.com; s=arc-20160816;
        b=R04uXhqLyjWycMepLMm/bIqL8yWKtK0EtJVVPBgQSP5eQxXKzdMGHyZI8fFfPU0e4a
         OlJlZwLR1QD7bXjxN1wknuLsM2wI5h9Dk0k5kujAxBg1d+Q1HzHJcf9AoHBvUK9Lhb3l
         iHj9kxkTfg8+2XfuIkaL+8vE+SUQ1/0O/a72tcnlctAV8VhjtTrEhcAaztuHf9/2Eg6D
         kjh1LTu1SEa1p9GuYrygxh8SOTxCZB/5buwlqAMt3ZMkFapVOXbw6FQ8F1Pi0USKdEsl
         /GwZx/zJgfg/dwDLWjCopRktmEUg83YvKHFxjFCtoJXJnPeIgaD7gqovUdN9SFE0HeQn
         yVWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=QzKVctpISYd4S2gLviIIxtW+ZEgm4Bz4L7FqSLquHR0=;
        b=CLGtWFGX4/0IOTfUVrj+c0epdnEXeSyqMfCegoAENbLqkjj0f1Z70nsAY/U8OV8xTy
         Qm89bGptYCKGiHomvHpAdXfdpOpJCaPcBsY4xAsFtg1/p1AW/w7ornNTQjfKQigca5bl
         TFMli0pWlXpPeNhFaRsTRO5nxUxZVlQwre1AVQX9WiJDajhL0VUS6H7JjPILEqomIw1O
         DAzfExKYWnR+CyxBOznJm+JCVTsFfbyUdWCvSCheRk9Bcx6kUOOPKyZoZabtRSWe4RE8
         9Vc8/OiAUF4cBeo3Uju8dTT4XDrSqN3KdG3zPHm9Y5V8pVX/tUwHRxlyqgOufsdRet4t
         46HA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=lf5wJcb5;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QzKVctpISYd4S2gLviIIxtW+ZEgm4Bz4L7FqSLquHR0=;
        b=Pz4PjrFLe6iOCbQ9akLrGIOCQu7qOryEbGqt6jxP1rQcssFioG0I46pO34Jk9AglGf
         zR7VmWWOx5Vsfy56s230KLC5V2mcFqMs0+vrmmBSLNVdJOTo/NL4bpHXAqIB3NwUqirp
         WZEx/IRKbDTuiKUMjwwgEk65bcN7VmPwL6S0IRso0ST5g9uM1xdqc/pISF4S4E5HMN4Y
         E+P4B4gvTV6FGscU3hDY/3mnkei8fqmzdvFVEF1AqLM1sVHuajzLJuuxDn49VrSuPyAg
         /7+PHbtXvEpcZuRjnzLZPZNwG60EzK5+31oZcX3kEh1z4HIv8pT8j5i7NtoRTyOFLKqD
         20Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QzKVctpISYd4S2gLviIIxtW+ZEgm4Bz4L7FqSLquHR0=;
        b=uCDgqq49oeVd7GI/Sme2hvxBTWRYGqLcI3OErmpx00jX4fH8yl/JGeVpKo6IjlA1mS
         5TZg4YZ+xQ3knEvQyHG00vf227eYJOQ8U9ppee+FR6gKszsF0O6ZZ1MF2pDxY8wuWLIt
         7owazHd3AM2xDjdxFvrrYTHRlIVtNbWB8PvtwruUIRo3dj91gJf1jSQLHDybCHDp/iVr
         Ia+Dzdk+xGnL9kPlsQptyGA2SJrp7KOWcSjwV9Y+OKQDeBi2EJf1y0wxpTGbhiOG532A
         xH3uXo8UcKatuoea9MAOYEb519CNLqsP3Gw4dl8V5MURcJ5EcgLnRmbbT/Mpj9dfECMA
         URKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Cxx5vDtWrI2tK5WtwipmD+dYpYdjqDKKSD0aaWB8k/S88bg8H
	YbwUZQ/DEk8mVx2O3Yb1/dM=
X-Google-Smtp-Source: ABdhPJweJ6ptY6blCPOnnQwnooeDz/cEv2d+LIMj8JD/QgSwDb2l3TdzdQUfR08NlLhjfaK6wE+DcQ==
X-Received: by 2002:a05:6512:303:: with SMTP id t3mr5825977lfp.7.1618653247584;
        Sat, 17 Apr 2021 02:54:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c7:: with SMTP id n7ls1652270ljj.3.gmail; Sat, 17 Apr
 2021 02:54:06 -0700 (PDT)
X-Received: by 2002:a2e:9d8f:: with SMTP id c15mr5226192ljj.494.1618653246666;
        Sat, 17 Apr 2021 02:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618653246; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFDTJuvQvE4FNr4scWYxpC1p+tPXtKa6pcs8m6o1SIdEyT6bgOWKqQQAGLaB6Xzih4
         Gq1rDj9KHB8qJxZAcNAlnIXSRoeLNPS5AgRTHsZCJjV/tB4cVEs7xrfKoqMATgfYtdfA
         h0lBrt8sVZeMH2uRJeld96N9JmyjnKT/6IjjFRlbtFUPUY+f5HASRvFv4kFMF+ZvNq8N
         27zNLtQbYS2+wrEdJHkhovZ9oeDREGp78IrkN4Taja4PN/YXK4C1aZDoJvMtWKkIiO5I
         KU4xf3fpb4bKwTex2RNiVlmiejwNY2ksqu1Qh3FsBEOF/lyySxJa+aTUI47rDEROMOZf
         H45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=ifcXKwr84zvqonUzcSEcAiXKgGPon1QlmJZElB0lZcM=;
        b=YzcLPPpUOnefSEevI3EXMS+7Rb1OxpBMJc4x/+ozEH38VPB7iGH5XTujUrk6Kzrlb+
         so1tDo8kDpfn19lRm0MpxrhZK8dhRW8XmaZZlV83q1Mi6RQ5tm1OAlrHl2z0HtSgBqi+
         SRrrDZEitLiP2j3Ww8by3v5f6Gpt+REf20u2YY38E5dbiLz0GLaIu4Xxwigr7KDWMCOZ
         ibHG3V2Q79J+qLltAIeFEFbcsKYLPPH/V56M/YwZq/ESOXUw4hBnw0DzGY9x2YiXTnsM
         G9oPEUVxR1MZV8bolVQmCfuZDdJ1zYqg6m9t7nqGv/KPiHMpNGYlGRHCJQ1EoX5OFMM6
         7p8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=lf5wJcb5;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id v3si506580lfp.0.2021.04.17.02.54.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Apr 2021 02:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.81 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sat, 17 Apr 2021 09:54:01 GMT
Received: from Pickup by email1.uni-rostock.de with Microsoft SMTP Server id
 15.2.792.3; Sat, 17 Apr 2021 09:53:58 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email1.uni-rostock.de
 (139.30.22.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Sat, 17 Apr 2021
 11:52:55 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0792.013; Sat, 17 Apr 2021 11:52:55 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: Inquiry
Thread-Topic: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAAR0rPA=
Date: Sat, 17 Apr 2021 09:52:55 +0000
Message-ID: <0c9af6906aa548c28b45548f895de2e6@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
In-Reply-To: <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.76.248]
x-tm-smex-dtas-header-wtp-uuid: 8ED510533BC5457439FFE66E03B1ACC14044FB1C
x-tm-smex-dtas-header-wtp-flag: E86D7FA298E5BF5C91B1B1620E328B6A9CBADDE50000
	924ecd1d-1100-4fba-a46f-d5da2b024de0:9757F9333200B88B432CC5ECB85BCACD4D9340
	3D000018ba6df2-2b0e-4ec1-a33f-2224d2945340
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26096.006
x-tm-as-result: No-10--6.905500-8.000000
x-tmase-matchedrid: aYrbhJIgRIMMPDZrnvcM98CxC+PryYbTgdkHykGcMpnPlmI4N1s8ihFE
	t97pQ+C8/aGRwW4Ryg6Jpc8jInUFK8wWg0eKwxc9s35egIUyB0xPlGyRFrFfWa3DfQXYDXXmvXx
	WlrWxzAX/J7/cdz0rWkQ0ZbDoCgw3MLoUrfsvv4JVJkE3tgzC0FtXgpRlmDcoaYn7tXmtFzNusD
	KmlKy9rbqmEEgNMeIaGwkuXqfweCTIjxBVS3PZ27zgL/eLACDEmGheEvjzATsSmqDR2ydDMHnr8
	nRWhMU9mUhH31Cro3pTWFc2/sxALo81yJsU3bpPIOm27sB08kMIoBnVYMlpasg/raFQvmccYuB8
	si+nmISEohtIhhGdZfoZhA+fRymh6XPULSuXiWqcVWc2a+/ju8yZqgcnwGkt6CeuoEOjnYyRbai
	hAmSwdy8LChVHuLtDPVIYRN6oI2GjxYyRBa/qJUl4W8WVUOR/9xS3mVzWUuCgZHIBpyeFprPkIr
	7Ra+BpAQbdaqrBbOgssb4sUT5jCijh6+wrwIvOftwZ3X11IV0=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--6.905500-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26096.006
x-tm-snts-smtp: 593A7DBFA7A0500B1BDC4AD82A05941ED9580255D0A48289919626AA6F56C8DE2002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de;       dkim=pass header.i=@uni-rostock.de
 header.s=itmz header.b=lf5wJcb5;       spf=pass (google.com: domain of
 moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender)
 smtp.mailfrom=moustafa.noufale@uni-rostock.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=uni-rostock.de
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

Thanks for your quick reply, I will follow these guidelines. Have a good da=
y.
Regards,

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Samstag, 17. April 2021 11:45
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; jailhouse-dev@googl=
egroups.com
Betreff: Re: Inquiry

Hi Moustafa,

On 16.04.21 10:29, Moustafa Noufale wrote:
>
> To whom it may concern,
> I am a Master student in Rostock University and I am studying=20
> Jailhouse this semester as a Master project and I would like to gather=20
> information about this Hypervisor, as well as I would like to ask,=20
> whether it is possible to install it on an Ubuntu Virtual Machine? I=20
> just need an outline, how I can learn it. I spent today reading the=20
> code on GitHub, but I need more information and appreciate it if you can =
help me.
>

A good starting point for experiments can be the images generated by [1], b=
oth for KVM VMs, pure QEMU emulation target or also real boards.
Note that emulating target inside a VM will work but using KVM (for x86) ma=
y not or is at least fairly slow. I would recommend a native Linux host.

Then you will find a lot of presentations on Jailhouse on the internet as w=
ell as an (aging) tutorial on how to bring it up on new hardware.

Jan

[1] https://github.com/siemens/jailhouse-images
[2]
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf
[2] https://www.youtube.com/watch?v=3D7fiJbwmhnRw

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0c9af6906aa548c28b45548f895de2e6%40uni-rostock.de.
