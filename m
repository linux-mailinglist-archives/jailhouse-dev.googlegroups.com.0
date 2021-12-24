Return-Path: <jailhouse-dev+bncBC653PXTYYERB2X3SWHAMGQETU2XI2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25F47ECE7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Dec 2021 08:59:39 +0100 (CET)
Received: by mail-qk1-x73d.google.com with SMTP id bj32-20020a05620a192000b0046dcca212b6sf6179146qkb.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Dec 2021 23:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NMp5Tg//NBNh9ew1SBZTSxxNDd/Mcf11Z2XL8Iu9geQ=;
        b=Tn39RuGlcp0KlzHBEeXMDGuOVUEhzeZSOTD1lpus6NC63QDqBH2ANNXFcDdFycEZUh
         iFMyY1NhVST8i7Ujz7ow5oj+8A5R09JgVBnyPYfWxrxBFUSC/YMx6HdCSuiq/rsRrgdI
         Jv6GbAI9/B+WmbSG6I/m4pOCU1EkRDzVt88jyqv8FuI24I2wQXwLLdCIqmzsBDT/ORO/
         9X2hOwls8rIxlTYk7T2WBjLLwj5EU8fzECLdSgkHw1P95PY7ntTeZudqeo+l6BhOY8E/
         OOmQz5vBAb1Q+imxtnsVbIxjAe6TcSFbKwPinh6Bin3jdc41XnxXFlGJNtGqp1eaC4a6
         OETw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NMp5Tg//NBNh9ew1SBZTSxxNDd/Mcf11Z2XL8Iu9geQ=;
        b=ktdAwG69VdHNOEA1O1RvelO4xlLIjeaKuIULyi2FyhUpdcd0+j5r92vGMAbjCzAO7m
         NsZJsUihTMJ2kHSxHE5t4Vx8CpepIWiyApjfD59zAfzIfIDvaEeeXIvQU+5WRUOixLMY
         QbYcedWT5Po1Y82WMaGpl59w/xDOwgiVsDYlc1CPg9+Af8NwKqQapQf7kusd9O/pkNw6
         P5zk0BKhW0nplrcT2d1/2WKnYv8aJ1qzI4HqqwTJ3aJ/fqPWqXjD40VzbK9YAlRqsHV4
         X5037OpOO2IGyGVBfzLx3WfzpDeyK40TMtY2rUpzVzSe4qwqlXg1ZOdTU1QaPU+rUcwd
         alog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NMp5Tg//NBNh9ew1SBZTSxxNDd/Mcf11Z2XL8Iu9geQ=;
        b=zF3Ex4L8E5d/RaaboLvsJKxJ8fcK9dEUugTWZCxQwBWkEJPhgjlMygm7q2vCQ8Cioo
         pZ7SSZc9an7zPm09i8boWPviSWgEphizEjykpWhumo59iOe1S6oLU5RV4MrLD1D37yeV
         W9z+yzn5upsPQOlPUHRJj2TnESgOQvZ0b88e4la0Emg7UJfhlNodYsXOwvIf5lTd/qBT
         GErnRMkE3LFo8R62doxjFGbEMqhPw0dkZZW9N0iJsrdA2A5ZJD/mUhTcLMBfVEmoF0CX
         QEdy6/dFsRJM/EA0ED2Kv5QD4fZ1dLqmpu9I/OEg2jEhdCUR4EgCQZr7A7WMn+vB6Y5U
         OJMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530VBKZpS02LnFMLbHmWe3mfKdqc3riUu6rc7D94EyDN87G4icSu
	IA4375wGiYrtF47rzqYsUug=
X-Google-Smtp-Source: ABdhPJxGBfGw98UURhDYz7/1CugOcnSCMMBff2D8/RjvgXvyWzntUI6U+LcUwwljE3V2KqFOwCom4w==
X-Received: by 2002:a05:6214:262c:: with SMTP id gv12mr4624026qvb.74.1640332778163;
        Thu, 23 Dec 2021 23:59:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:8e89:: with SMTP id x9ls3246368qvb.4.gmail; Thu, 23 Dec
 2021 23:59:37 -0800 (PST)
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr4787880qvb.39.1640332777470;
        Thu, 23 Dec 2021 23:59:37 -0800 (PST)
Date: Thu, 23 Dec 2021 23:59:36 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c31f9750-cf66-4afc-a5f6-7c93a8a93f7fn@googlegroups.com>
In-Reply-To: <OS3PR01MB78280EB0F9EA05EA0D747D78D77E9@OS3PR01MB7828.jpnprd01.prod.outlook.com>
References: <AQHX96wfrFW+jFZPEUKn5StLKD9cuQ==>
 <OS3PR01MB78280EB0F9EA05EA0D747D78D77E9@OS3PR01MB7828.jpnprd01.prod.outlook.com>
Subject: Re: help about the GUI on non-root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_38_1287046275.1640332776664"
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

------=_Part_38_1287046275.1640332776664
Content-Type: multipart/alternative; 
	boundary="----=_Part_39_1978792861.1640332776664"

------=_Part_39_1978792861.1640332776664
Content-Type: text/plain; charset="UTF-8"

Hi, 
I have been porting jailhouse to Raspberry pi4 for the last few weeks. The 
image provided by jailhouse-images has really a minimalist approach and you 
have to add each feature from your choice in the defconfig for arm64 in 
jailhouse-images. I would think that the answer is yes to your questions, 
but what are the requirements? I think you would need design your kernel 
for the non-root cell yourself, and also modify which hardware is used in 
the device tree file for non-root cell. The jailhouse-image is really a 
good start to understand jailhouse, but it is always better if you could 
port it. 

Moustafa 

On Thursday, 23 December 2021 at 04:25:11 UTC+1 Fred Wang wrote:

> Hi,
>
> How to add Graphic user interface in the Linux non-root cell?  I mean Is 
> it possible to add GUI interface on Linux cell to facilitate some 
> operation. Can GUI apps be run in the non-root Linux cell?  
>
> The setup used is the image produced by jailhouse-image for Raspberry pi 
> 4b. I can only access the root cell via UART and ssh to the no-root Linux 
> cell.
>  
> Thanks,
> Fred
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c31f9750-cf66-4afc-a5f6-7c93a8a93f7fn%40googlegroups.com.

------=_Part_39_1978792861.1640332776664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<br>I have been porting jailhouse to Raspberry pi4 for the last fe=
w weeks. The image provided by jailhouse-images has really a minimalist app=
roach and you have to add each feature from your choice in the defconfig fo=
r arm64 in jailhouse-images. I would think that the answer is yes to your q=
uestions, but what are the requirements? I think you would need design your=
 kernel for the non-root cell yourself, and also modify which hardware is u=
sed in the device tree file for non-root cell. The jailhouse-image is reall=
y a good start to understand jailhouse, but it is always better if you coul=
d port it.&nbsp;<div><br></div><div>Moustafa&nbsp;<br><div><br></div></div>=
<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursd=
ay, 23 December 2021 at 04:25:11 UTC+1 Fred Wang wrote:<br/></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
How to add Graphic user interface in the Linux non-root cell? =C2=A0I mean =
Is it possible to add GUI interface on Linux cell to facilitate some operat=
ion. Can GUI apps be run in the non-root Linux cell?=C2=A0
<div><br>
</div>
<div>The setup used is the image produced by jailhouse-image for Raspberry =
pi 4b. I can only access the root cell via UART and ssh to the no-root Linu=
x cell.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<span>Fred</span><br>
</div>
</div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c31f9750-cf66-4afc-a5f6-7c93a8a93f7fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c31f9750-cf66-4afc-a5f6-7c93a8a93f7fn%40googlegroups.co=
m</a>.<br />

------=_Part_39_1978792861.1640332776664--

------=_Part_38_1287046275.1640332776664--
