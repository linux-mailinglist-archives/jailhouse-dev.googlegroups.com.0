Return-Path: <jailhouse-dev+bncBCL2X6UI2MBBBC57SSVAMGQEG7IJYMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3d.google.com (mail-oa1-x3d.google.com [IPv6:2001:4860:4864:20::3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9F7E0686
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Nov 2023 17:27:59 +0100 (CET)
Received: by mail-oa1-x3d.google.com with SMTP id 586e51a60fabf-1ef39189888sf561332fac.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Nov 2023 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699028878; x=1699633678; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fg5EnJZWicDCkqGJPxt97O3XuqKZuzPg3NZp8iw0in8=;
        b=iR+jFndtzBsGisDV5u7dz1Ho1c3GoLLu0WesO6wLAbMbtTwvg4UudvkNFOJpAxnrDT
         FBfRzLAmwIQ0nqUIdgE38yTH75XlGIOoQ1LF0GRNNfCclo2wjmtkWDc5QNOXimvjH8Xs
         J55vcavMxFMH8MhedoA7ZXqEZeTfaJOiJT38HFiT05tZt5NIq1LwsnTLAIDH6P9f0i9v
         5aAHLz45q5KLROiYvVeruaPOpx3m8x4Bd2Z/ysk/egK0gwdAp2b0GvmPIbFASiwsu+Fh
         BE442R+64ZdXBQO6BJvsS9MokohlnxGjtqctGbY4df+SYxU4M/G2iwHLMkFHQsegOIt0
         WZJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699028878; x=1699633678; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg5EnJZWicDCkqGJPxt97O3XuqKZuzPg3NZp8iw0in8=;
        b=VMdV8rhZWoStqBJ5GdUjdNkXmuk237VegxM9Yh4/0R2cWTETLwxXQ4fWXl8bb25n6F
         Hrh3VMLS3mK790RDcWlQoNbJTgboM+oynkvSPyC7x1ctDL/AX3VoPzgoNjNoNaQ2NTJz
         hUlSA4AGl8qIxAGJNM/r4PuF/RDdNNtwsBWFt40Qex1Ux7XvJE7Z+N4IJ8alBaJp1Aay
         v1EBZk4IoWRT4cwQXWwO7gElNbu+gLRLat1e5NdHyo77n/cLGlsiY7Q6k3SglUtF4k6x
         qF1IRxNri/NeEOhHie7H1UYFGApm+t/ta2JHB/xRITEZrUt1++2L5yJ8A2he1JVs2sLb
         y8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699028878; x=1699633678;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fg5EnJZWicDCkqGJPxt97O3XuqKZuzPg3NZp8iw0in8=;
        b=gJu6M0zNBzKw7t+0Vhu450W6Z85n2WljIaOUfi+MVwcX5skMnij8Pw6jx7/7DgJoy+
         k4vvwNIEnmLQXKTg6LVqJR19x3tyZFATnna/5/WJRRQyaL+jwdhYXhu/WAufgRNg5YIG
         68UfJ4hHWG/XjbNnWaNDJbAH4O3Igil2chRth/W5FbIS+W6XSLXrUF5+qozCre7jLamB
         s1e+UrhTO8fhtYCAqmaA24lnI4rEwkLLsLvXpQqfYY+ya7aYV6ZEW7SSVHWWfPwHjwnZ
         Sp2gv/2UGSOa8qiv+PH+2VOdNZ/XrcWLh8+fjCLq2t+Lv4Y7Dd7pO8aXNA0WDc+eFaxr
         6dVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxW1wyVFvxeykOSSAxCsk1w4ie9lRV7F7rX2HV0uvE74lYKnLi+
	Lfi+UccCk89zwAKjelJdFRs=
X-Google-Smtp-Source: AGHT+IEsfwinhUa9F1udkgAJ3RWaaC+SJIgFeSVjW6/aMnCPu+ts4JwsyJAVSup2TSHx2xtb+//GTA==
X-Received: by 2002:a05:6870:3646:b0:1e9:bbfe:6458 with SMTP id v6-20020a056870364600b001e9bbfe6458mr23698955oak.1.1699028876056;
        Fri, 03 Nov 2023 09:27:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6871:8010:b0:1f0:4ef9:f2b2 with SMTP id
 sk16-20020a056871801000b001f04ef9f2b2ls810120oab.0.-pod-prod-06-us; Fri, 03
 Nov 2023 09:27:54 -0700 (PDT)
X-Received: by 2002:a05:6870:440a:b0:1e9:b0fa:de72 with SMTP id u10-20020a056870440a00b001e9b0fade72mr10290199oah.9.1699028874505;
        Fri, 03 Nov 2023 09:27:54 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:27:53 -0700 (PDT)
From: Giorgio Farina <giorgio.fari96@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1994ea5a-44dd-453b-8571-0c66e5a5e734n@googlegroups.com>
In-Reply-To: <740977cf-abe3-4b83-8f61-b238578292f8n@googlegroups.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
 <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB71846A56477610902A29AE7DB6F20@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <c8ea6145-8504-328d-ccfd-e57b052d9ee4@siemens.com>
 <740977cf-abe3-4b83-8f61-b238578292f8n@googlegroups.com>
Subject: Re: JAILHOUSE_ENABLE: Input/output error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13258_2094013453.1699028873611"
X-Original-Sender: giorgio.fari96@gmail.com
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

------=_Part_13258_2094013453.1699028873611
Content-Type: multipart/alternative; 
	boundary="----=_Part_13259_786622855.1699028873612"

------=_Part_13259_786622855.1699028873612
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I add more info about my error.
Linux is the host OS, which runs a VM (i.e., QEMU/KVM VM) with a jailhouse=
=20
image.
Below, I represented the sequence of operations and outputs.
*Linux: *./start-qemu.sh x86
*QEMU/KVM VM: *Jailhouse enable /etc/jailhouse/qemux96.cell
*QEMU/KVM VM: *JAILHOUSE ENABLE: input/output error
*Linux:* Initializing Jailhouse hypervisor v0.12 (342-gd6e64f90) on CPU 0
Code location: 0xfffffffff0000050
Using x2APIC.

*Note that Jailhouse hardware check returns PASSED*

Best,
Giorgio



Il giorno venerd=C3=AC 3 novembre 2023 alle 11:09:36 UTC-4 Giorgio Farina h=
a=20
scritto:

>
> Hello everyone,
>
> Jailhouse (x86) on ESXI Hypervisor (i.e., VMware) cannot work (in nested=
=20
> virtualization), *as the preemption timer is not emulated.*
> Instead, I have a question about Jailhouse images.
> I got a Jailhouse image for x86. Now, I am trying to run the image with=
=20
> the command "./*start_qemu x86*". Linux starts and boots fine.
> I checked the hardware features with "*jailhouse hardware check*", and I=
=20
> *passed* also the hardware checks.
> However, when I try to run "Jailhouse enable /etc/jailhouse/qemux96.cell"=
,*=20
> I get the error "input/output error".*
> could you give me an explanation?
>
> Best,
> Giorgio
> Il giorno gioved=C3=AC 3 dicembre 2020 alle 08:39:39 UTC-5 Jan Kiszka ha=
=20
> scritto:
>
>> On 03.12.20 14:35, Sainz Markel wrote:=20
>> > I've been struggling with this with no luck. Any ideas of why this=20
>> could happen? I've found no info at all about this two checkitems,=20
>> apparently with the VT-x virtualization enabled should be enough...=20
>>
>> This is a VMware issue, nothing you can fix. Their proprietary=20
>> implementation lack feature Jailhouse require. If it were a KVM issue,=
=20
>> we could patch the code (as I did a lot during Jailhouse development in=
=20
>> 2013).=20
>>
>> IOW: Don't use VMware to demonstrate Jailhouse.=20
>>
>> Jan=20
>>
>> PS: And please avoid top-posting.=20
>>
>> --=20
>> Siemens AG, T RDA IOT=20
>> Corporate Competence Center Embedded Linux=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1994ea5a-44dd-453b-8571-0c66e5a5e734n%40googlegroups.com.

------=_Part_13259_786622855.1699028873612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I add more info about my error.</div><div>Linux is the host OS, which =
runs a VM (i.e., QEMU/KVM VM) with a jailhouse image.<br /></div><div>Below=
, I represented the sequence of operations and outputs.<br /></div><div><b>=
Linux: </b>./start-qemu.sh x86<br /></div><b>QEMU/KVM VM: </b>Jailhouse ena=
ble /etc/jailhouse/qemux96.cell<br /><div><b>QEMU/KVM VM: </b>JAILHOUSE ENA=
BLE: input/output error<b><br /></b></div><div><b>Linux:</b> Initializing J=
ailhouse hypervisor v0.12 (342-gd6e64f90) on CPU 0<br />Code location: 0xff=
fffffff0000050<br />Using x2APIC.<br /></div><div><br /></div><div><b>Note =
that Jailhouse hardware check returns PASSED</b><br /></div><div><br />Best=
,<br />Giorgio</div><div><br /></div><div><br /></div><div><br /></div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno ven=
erd=C3=AC 3 novembre 2023 alle 11:09:36 UTC-4 Giorgio Farina ha scritto:<br=
/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>Hello every=
one,<br><br>Jailhouse (x86) on ESXI Hypervisor (i.e., VMware) cannot work (=
in nested virtualization), <b>as the preemption timer is not emulated.</b><=
br>Instead, I have a question about Jailhouse images.<br>I got a Jailhouse =
image for x86. Now, I am trying to run the image with the command &quot;./<=
b>start_qemu x86</b>&quot;. Linux starts and boots fine.<br>I checked the h=
ardware features with &quot;<b>jailhouse hardware check</b>&quot;, and I <b=
>passed</b> also the hardware checks.<br>However, when I try to run &quot;J=
ailhouse enable /etc/jailhouse/qemux96.cell&quot;,<b> I get the error &quot=
;input/output error&quot;.</b><br>could you give me an explanation?<br><br>=
<div>Best,</div><div>Giorgio<br></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">Il giorno gioved=C3=AC 3 dicembre 2020 alle =
08:39:39 UTC-5 Jan Kiszka ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 03.12.20 14:35, Sainz Markel wrote:
<br>&gt; I&#39;ve been struggling with this with no luck. Any ideas of why =
this could happen? I&#39;ve found no info at all about this two checkitems,=
 apparently with the VT-x virtualization enabled should be enough...
<br>
<br>This is a VMware issue, nothing you can fix. Their proprietary
<br>implementation lack feature Jailhouse require. If it were a KVM issue,
<br>we could patch the code (as I did a lot during Jailhouse development in
<br>2013).
<br>
<br>IOW: Don&#39;t use VMware to demonstrate Jailhouse.
<br>
<br>Jan
<br>
<br>PS: And please avoid top-posting.
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1994ea5a-44dd-453b-8571-0c66e5a5e734n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1994ea5a-44dd-453b-8571-0c66e5a5e734n%40googlegroups.co=
m</a>.<br />

------=_Part_13259_786622855.1699028873612--

------=_Part_13258_2094013453.1699028873611--
