Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBZOU43UQKGQEXRDWXUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DE374EDC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 15:11:02 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id v72sf19535504oia.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U62EtP79Zd9dLLkgBMLcpfH3RQ45RQxlo6wUkuOfvOE=;
        b=JsIS0vaw12VvbQMx2dIW1hj+1uChtXznJ4fQCatnBdxrNfUe20UBl2jiPVgyAbQRrP
         M3MLJ5jCqxluZvH82KCT74efvhIw9zUeLMDDZYNlZy6NWPExSYGb2H16XsLXek6ab0PU
         ZZZIzxxh2oW9qD4TkWwP2gQUdZARGMmuDpaXAmvrEgPrUEH4mp+MsiNegu9Nnlq3CFiU
         nLJhg+CMCTTtE/X4pTBGHSWgimKxpim4R8tp+4uDpo+vXPTb6c9qyKFsFtorKcVm/7rQ
         TP3OJNS8bOtLT3Ff7vDjeS6l7EP9zxFz3dUFHD8MtbBuPaapDCWcxb9gHL4rvoh0PYfv
         qqGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U62EtP79Zd9dLLkgBMLcpfH3RQ45RQxlo6wUkuOfvOE=;
        b=pUTRGXmyBmr5pw9M6ZMd2EuYE7IJ8w6Xe9gTYCUhXF3Dv7M9h+KvncqWpKym0KYLaM
         UMxMfADri8CXmdha8xPVuMPkHOfrGWnWIJq9zhT8lgBsmt9Xa0YhwtvsSWDF5jjpB1rV
         QxAYXc/BETsUlBl07E7ZN+1pVdPGvwivi6082EEt1my6fJC8z5l0ukc+xDKV4YcM2+f5
         dbsUFzjuKXF/M280/1q7vI1Gf7Z79zi8AuguDk7Q5gJvh94tbhRVI2qyV4B6Mrhg8ech
         gkahvYycCZO0KSe0loGKmQawl44hHxgek/VkGd3uZ7cCC1YqtxOVLxa1cBhBHhBQewO0
         +UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U62EtP79Zd9dLLkgBMLcpfH3RQ45RQxlo6wUkuOfvOE=;
        b=lc8cCYmmqb89/pH/4XYLTluEQ/B1d7ZI4F8exgqZJyJ933+C25/7ejHSh9UbrkYzpI
         zUvqF68SMzX3zNU4QBSHAT+z/18IJXTL08YrmC8Hei3YCdkcpwrJQxS5edhjiLjamuQR
         kxPZSG3zIzsE+ad4ofKKvqznPkIyJs0XgMJAy27CsVPEu2bCUV1fE0MDKQXg537cZq8q
         w68fgJYxIpIcQCYHTjJaDoqkfXg3txHoc+/SEwCkj/I3EqDCarBt35H3Tx4GN5bSC9j9
         /egURNM+bFZ8ZzGP0D7tIs4SBjgXevRj1Q0LgF7VRLGxIR0yWgXk3trSsleBctz/kYS/
         nanA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3tnz0D6WfLu82n7okYrdCyz8ks7H9j6us/c9zwwmH9HdWVGE6
	IOjMbcp7INEBba0lZGGZzjo=
X-Google-Smtp-Source: APXvYqxBj1bZEyJvIM/ui+Fr15T+crPtwSp3aI75n7cvuvgx26z9dwAAfEHhvyqVF4QSSxsLzBPusQ==
X-Received: by 2002:a9d:eab:: with SMTP id 40mr65997757otj.316.1564060261265;
        Thu, 25 Jul 2019 06:11:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3f62:: with SMTP id m89ls9578019otc.1.gmail; Thu, 25 Jul
 2019 06:11:00 -0700 (PDT)
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr1149904otb.81.1564060260773;
        Thu, 25 Jul 2019 06:11:00 -0700 (PDT)
Date: Thu, 25 Jul 2019 06:11:00 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
In-Reply-To: <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7129_661062445.1564060260236"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_7129_661062445.1564060260236
Content-Type: multipart/alternative; 
	boundary="----=_Part_7130_270543785.1564060260236"

------=_Part_7130_270543785.1564060260236
Content-Type: text/plain; charset="UTF-8"

Another question that i have is: when i try to issue jailhouse cell linux, 
i need to add to the script (jailhouse-cell-linux) the path of pyjailhouse 
(sys.path.insert(0, "/usr/local/libexec/jailhouse")) otherwise it doesn't 
find the module pyjailhouse.cell and it gives error.

In pyjailhouse.md it says the following:

> When we install any python script that uses pyjailhouse, we remove sys.path[0] 
> = os.path.dirname(... from the installed scripts, leaving python to 
> import pyjailhouse from where pip installed it.

but it seems python doesn't find the path and i need to add the path 
everytime i want to use jailhouse cell linux.  

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/de716a1a-110f-4fac-864c-54043152997e%40googlegroups.com.

------=_Part_7130_270543785.1564060260236
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another question that i have is: when i try to issue jailh=
ouse cell linux, i need to add to the script (jailhouse-cell-linux) the pat=
h of pyjailhouse (sys.path.insert(0, &quot;/usr/local/libexec/jailhouse&quo=
t;))=C2=A0otherwise it doesn&#39;t find the module pyjailhouse.cell and it =
gives error.<div><br></div><div>In pyjailhouse.md it says the following:</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><font size=3D"=
2"><span style=3D"color: rgb(36, 41, 46); font-family: -apple-system, Blink=
MacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Ap=
ple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&qu=
ot;;">When we install any python script that uses pyjailhouse, we remove=C2=
=A0</span><code style=3D"box-sizing: border-box; font-family: SFMono-Regula=
r, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; background-colo=
r: rgba(27, 31, 35, 0.05); border-radius: 3px; padding: 0.2em 0.4em; color:=
 rgb(36, 41, 46);">sys.path[0] =3D os.path.dirname(...</code><span style=3D=
"color: rgb(36, 41, 46); font-family: -apple-system, BlinkMacSystemFont, &q=
uot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&q=
uot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;">=C2=A0from =
the installed scripts, leaving python to import pyjailhouse from where pip =
installed it.</span></font></blockquote><div>but it seems python doesn&#39;=
t find the path and i need to add the path everytime i want to use jailhous=
e cell linux.=C2=A0=C2=A0<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/de716a1a-110f-4fac-864c-54043152997e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/de716a1a-110f-4fac-864c-54043152997e%40googlegroups.com<=
/a>.<br />

------=_Part_7130_270543785.1564060260236--

------=_Part_7129_661062445.1564060260236--
