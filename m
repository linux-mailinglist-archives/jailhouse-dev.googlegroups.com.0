Return-Path: <jailhouse-dev+bncBC653PXTYYERBDXKXCGAMGQEKMZZMDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8944E3E0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Nov 2021 10:34:08 +0100 (CET)
Received: by mail-qk1-x73c.google.com with SMTP id ay9-20020a05620a178900b00462db20ac02sf6004442qkb.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Nov 2021 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jNHSCo93Ju6MW79tTlDpOR8BDdvNLl6IvK0+MXepfvA=;
        b=WX/g2hn9uUS4IkQsan3vHCr6NzL5fJ43oJ+wZJo2najCpl5WPqlAPTtEpWuq5VkEqc
         TXGlgDPZ2dgLr1qN+ChQkFcFSZvl3sqC1HCEHgVnJOvZ0EkutyPRFsSzbuY/ia3el4gm
         bAGrir0nqlP11pVgLA6cD+ZzAnYepS4L33EoY05kVJDgO9sYCM56jx4NGYmn9Q9pdM+i
         NVSMwBzWKI5hb9vRT1V5QQbltGwjX50UnRHgRqOTSDZViocD6e5KmzJtpvhPdwQydkvQ
         UazBLpP6cUWWgmK3hAZDm4P13CA31ZwgpEvUMM2cb6UA6d3BlLHVtf8xVvGin6hnDvIq
         coAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jNHSCo93Ju6MW79tTlDpOR8BDdvNLl6IvK0+MXepfvA=;
        b=D8+O/tBJol7yVpsKqwrpeoola8z1Mqs8uVSn2m78S4D+6CWb2KB1AHblguR6SyPlSX
         Ss6iajoq9CQT4rA4kwwLaFevSoSLMMJZALlk6USW7IGFTteLJKEXWUl1aLX7keRkbkZt
         5WuWCDUpVMDzyvAvpLwt5gbrIuikOLmvB3EXATkvrMxVHvE1uvZfhAocK1p4m7i06IL/
         1Ij1a6HeqW8DGAm7I2sSGPnUoBujJU11kRjH/ShuM1ThS5t6C9niy4hCy7NG1RsLtmHe
         cJHVZrIfSi06iDAWgDiI58sFPiIGGOVKpgVGvr4nlDGQjeb5rIWSIG42joqY6l/2lDrz
         upgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jNHSCo93Ju6MW79tTlDpOR8BDdvNLl6IvK0+MXepfvA=;
        b=yDylog8voW7PQwr10L6I29xFNgwF5wGy+oy9ZirV7fbVV1t+a7fAUo4WWl/76ZMCQR
         pqkAjM7ygyRhWwsNzHOVgjABLzob/H0u5Q8GdetAu4bsSRLloPeKr3jX7G8OoD5yzM6n
         K3L+9wJuOc9igf54fG544Pn4xSkA7ratGmQnx/SgL1CoexOhfcjfuY3vF4ZFpgFOq3Bk
         BGf2jC15u3QUGS+XqnCvQimUjsfnn0B5aMmZeoXNG76VBgJu27tbt18m72sicX6+BbY9
         4e08qzpDgLBOUzAE+jV8MWbcdY21J5jOXirOq4l8RbDrS07QZcR+0vzFka0UF0hADGMN
         j/OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nnw20W7DGLtm4Ynhsk5/hvbuxJivQChKcsRi2wrWLrdwgo96d
	jYKkBf8x83tf8SFO9/5SJrA=
X-Google-Smtp-Source: ABdhPJzBTEdKDkO+dK+0qAnDZDueqITc1GUFPhtDoQ2NqVcSqswd4ZYlVEQgbaiLqYupJ2/ndzY3Cg==
X-Received: by 2002:a05:6214:e83:: with SMTP id hf3mr13439172qvb.52.1636709647120;
        Fri, 12 Nov 2021 01:34:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:85:: with SMTP id o5ls3347848qtw.3.gmail; Fri, 12
 Nov 2021 01:34:06 -0800 (PST)
X-Received: by 2002:a05:622a:40a:: with SMTP id n10mr14764394qtx.161.1636709646411;
        Fri, 12 Nov 2021 01:34:06 -0800 (PST)
Date: Fri, 12 Nov 2021 01:34:05 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
In-Reply-To: <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_692_1041640678.1636709645745"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_692_1041640678.1636709645745
Content-Type: multipart/alternative; 
	boundary="----=_Part_693_1605906410.1636709645745"

------=_Part_693_1605906410.1636709645745
Content-Type: text/plain; charset="UTF-8"


>
> >You are targeting RPi4, right? Again, jailhouse-images has everything to 
> >get the ball rolling. From there, start exchanging pieces that you want 
> >to have in a different flavor. 

 
I used the configuration file from Jailhouse-images, I got error on 5.10 
kernel:
 __get_vm_area_caller
 ioremap_page_range
 __hyp_stub_vectors
are undefined, so what may be missing here? 

> >Regarding the concrete question: 
> > either a support physical PCI host controller (so far only worked 
> >with the old Seattle board) 
> >or a virtual PCI controller configured in the root cell config (see 
> >configs/arm64/rpi4.c) 
> >support for CONFIG_PCI_HOST_GENERIC and CONFIG_OF_OVERLAY 
>
Back to 5.4, I added support, but I got another error: 
lspci: sysfs_scan: Invalid domain ffffffff
So, where shall i continue?
5.4: Jailhouse working, problem with virtual pci.
5.10: Jailhouse not compiling. 

Best regards
Moustafa Noufale 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9072dd41-feb1-486d-86be-7160e23240edn%40googlegroups.com.

------=_Part_693_1605906410.1636709645745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">&gt;You are targeting RPi4, right? Again, jailhouse-images has everythi=
ng to
<br>&gt;get the ball rolling. From there, start exchanging pieces that you =
want
<br>&gt;to have in a different flavor. </blockquote><div>&nbsp;</div><div>I=
 used the configuration file from Jailhouse-images, I got error on 5.10 ker=
nel:</div><div>&nbsp;__get_vm_area_caller</div><div>&nbsp;ioremap_page_rang=
e</div><div>&nbsp;__hyp_stub_vectors</div><div>are undefined, so what may b=
e missing here?&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1e=
x;">&gt;Regarding the concrete question:
<br> &gt; either a support physical PCI host controller (so far only worked
<br>&gt;with the old Seattle board)
<br> &gt;or a virtual PCI controller configured in the root cell config (se=
e
<br>&gt;configs/arm64/rpi4.c)
<br> &gt;support for CONFIG_PCI_HOST_GENERIC and CONFIG_OF_OVERLAY
<br></blockquote><div>Back to 5.4, I added support, but I got another error=
:&nbsp;</div><div><span style=3D"white-space: pre-wrap;">lspci: sysfs_scan:=
 Invalid domain ffffffff</span></div><div>So, where shall i continue?</div>=
<div>5.4: Jailhouse working, problem with virtual pci.</div><div>5.10: Jail=
house not compiling.&nbsp;</div><div><br></div><div>Best regards</div><div>=
Moustafa Noufale&nbsp;<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9072dd41-feb1-486d-86be-7160e23240edn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9072dd41-feb1-486d-86be-7160e23240edn%40googlegroups.co=
m</a>.<br />

------=_Part_693_1605906410.1636709645745--

------=_Part_692_1041640678.1636709645745--
