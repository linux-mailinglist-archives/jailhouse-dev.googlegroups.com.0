Return-Path: <jailhouse-dev+bncBC653PXTYYERB7W272GAMGQEEBG7IFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA545DD90
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Nov 2021 16:36:31 +0100 (CET)
Received: by mail-qk1-x738.google.com with SMTP id c1-20020a05620a0ce100b00468060d41ecsf6943582qkj.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Nov 2021 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=edpWbyuxtutp7cPrX5ckYS0pk5xxRombj3tylD3G+fs=;
        b=CYNH56sf297/Ao/wlpq0Xhok6EiCsnx749GkReZK9WbwcixqHdClrlVqQVvlEon0ob
         zTu5RRTExAiRztEtRiSGcZdcNAXiKcJfCE9RO1IRiJ9olliLSuClLrTYGvYmlpR5MzQ8
         YyF9S51VXZy8XKmXKhPGV6YLQ8KkdVSBX3NlBIdEpr0xfpHL8Stvpvetii8G2J/U1vpR
         1rJBqzA/lE1h3pVTv04jNNjDzyNDFwjAuDiIkI7MYzOc56bepaByCGKIpYS3UXf9iWNU
         nkewHTSGs8bHV+HL1rlrnHpKVBE1uW6fMT7bXNhJIOLGlG4JcLMAfmqYEZ3qj4E5qpo3
         8L5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=edpWbyuxtutp7cPrX5ckYS0pk5xxRombj3tylD3G+fs=;
        b=NBF8d382ZXpXc0F25fTdGb5+Y5II3EXuzPY1baeJ79w4E//sPxklM4bPhZfoQd5XrQ
         mTHxPO46XNl1j06eT7b/r7C9WzkuitxWtEQMvEavzfepu/iz5exQbsmCvwlPJBX9lHqx
         PIdd8hzqzB0Khff4/Dt0dFQI7ekMeu+5EfFBFi7sNdHuah01HEROr6eXzp0s9i8bV7I3
         WsastGBmYid2gGJ9iS2NGqN9RGQYhMCLuDigKRWgaYhB9Ldw9+UJ7gU/4c5oQyfVhl8o
         hHJyFFvtPnEdPHznuGNFrnOnhRCL7ShcwLdStKUnCQtZF79ZMaMo/p5F+/WZJyLe7sNo
         MNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=edpWbyuxtutp7cPrX5ckYS0pk5xxRombj3tylD3G+fs=;
        b=5n34z2ESvT+Lu2EA8XuYhxCdw2wRerzH/3gXqJCQv4n4JxEC9hS0XWgfUEER0ntbrj
         d727/oQRpD2gEqnR7mUZ6wmjvBfhdw94YFMmCPevM9aRVPPknsNStXyRWst9EUhq5dL9
         /fh3JG/XfdogxJQAyOQstyIPwfsEJWIIzzjLeGerubtYShqGTu2N2g7j2wvw6z7TJonA
         edkKnG9+yZ90ZLQVeCCsng55Ap/8eEh0BbM5tncITVm3ZXLj/Mcx8x1n1zHH3CSkN9Qq
         OwblHCRYjnTbPNdb1QxGmXIpbI/wc65uJtv1E2uyo/2yNqrBv0wh9bo4fgZT2hKRcbhh
         9Brw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532kWmSTpC15O3OUCQQZ6qscWyHPL+12KBD7rhWl5R0XoGrTt5GY
	KzVZypth538S0/SRxlHcepI=
X-Google-Smtp-Source: ABdhPJzvZpxtKP3/Tf3xQBCqYkYelg7wr3ToLyYbYgj1TKHbPUMni6yzDjXgcwRkb1l2GmcuKTifkg==
X-Received: by 2002:ac8:7c42:: with SMTP id o2mr9422320qtv.424.1637854590660;
        Thu, 25 Nov 2021 07:36:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5c05:: with SMTP id i5ls1899071qti.4.gmail; Thu, 25 Nov
 2021 07:36:30 -0800 (PST)
X-Received: by 2002:ac8:7dc1:: with SMTP id c1mr17785399qte.275.1637854590001;
        Thu, 25 Nov 2021 07:36:30 -0800 (PST)
Date: Thu, 25 Nov 2021 07:36:29 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ccf64b1a-986c-4f02-8103-5a04f99a8a5fn@googlegroups.com>
In-Reply-To: <83e82fe2-6a32-339c-01bf-46a7a51d8e22@siemens.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
 <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
 <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
 <83e82fe2-6a32-339c-01bf-46a7a51d8e22@siemens.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4650_1776114555.1637854589506"
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

------=_Part_4650_1776114555.1637854589506
Content-Type: multipart/alternative; 
	boundary="----=_Part_4651_198028382.1637854589506"

------=_Part_4651_198028382.1637854589506
Content-Type: text/plain; charset="UTF-8"

 

>
> https://github.com/siemens/linux/commits/jailhouse-enabling/5.10 
>
 What is the cleanest way to apply the patch? I used the following commands 
and installed Jailhouse, and loaded the kernel Image produced by the patch.
make defconfig
make -j4 Image modules dtbs
sudo nice make -j4 bindeb-pkg
sudo dpkg -i *.deb
jailhouse was compiled successfully, but commands are not working. So, am I 
missing something? do I have to copy the .dtb files?

Regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ccf64b1a-986c-4f02-8103-5a04f99a8a5fn%40googlegroups.com.

------=_Part_4651_198028382.1637854589506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&nbsp;<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;"><br><a href=3D"https://github.com/siemens/linux/commits/jailh=
ouse-enabling/5.10" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://github.com/siemen=
s/linux/commits/jailhouse-enabling/5.10&amp;source=3Dgmail&amp;ust=3D163794=
0849721000&amp;usg=3DAFQjCNGyjdPEB9yNTkuKGhvewjJZHvxKCw">https://github.com=
/siemens/linux/commits/jailhouse-enabling/5.10</a>
<br></blockquote><div>&nbsp;What is the cleanest way to apply the patch? I =
used the following commands and installed Jailhouse, and loaded the kernel =
Image produced by the patch.</div><div>make defconfig<br>make -j4 Image mod=
ules dtbs<br>sudo nice make -j4 bindeb-pkg</div><div>sudo dpkg -i *.deb</di=
v><div>jailhouse was compiled successfully, but commands are not working. S=
o, am I missing something? do I have to copy the .dtb files?</div><div><br>=
</div><div>Regards, <br>Moustafa Noufale</div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ccf64b1a-986c-4f02-8103-5a04f99a8a5fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ccf64b1a-986c-4f02-8103-5a04f99a8a5fn%40googlegroups.co=
m</a>.<br />

------=_Part_4651_198028382.1637854589506--

------=_Part_4650_1776114555.1637854589506--
