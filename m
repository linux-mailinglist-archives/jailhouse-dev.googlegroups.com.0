Return-Path: <jailhouse-dev+bncBC653PXTYYERBT7CT6GAMGQEFBRPTFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF8447389
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Nov 2021 16:31:28 +0100 (CET)
Received: by mail-qk1-x73d.google.com with SMTP id s20-20020a05620a0bd400b0045e893f2ed8sf9209345qki.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Nov 2021 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SGeLvjZb2IE5c5c7lrllc0QjMVdEmMH6DY0p+fMngjw=;
        b=X/l0ddAbd92a24D63nFKEzX82DGhuIl3GYrL12eN0WvAxIxAfD0CXDCT+pCrOdEjNS
         5whxuCnSnpIuPBkDHx+iR9RmRvq0Ouq4XL5qThbpC/Bfdimd/fKpZxrbWuHB9JF7fBWj
         4YgaHglqYE3pZSskDzPBv3q7RMLREreH9msbeBKFJaJI80deXBJ9ALAcKMbjazc/JeJ1
         bHii/a0xUavcJJ5e+ZiCMfnferNFBRDwjPy5QZBExnY9fZX3So+JpRA2yHcOnunLVGFR
         me1k80p5WXwoc6IXNTMfZbkDs/sYmhMDTdriPXDS/ZrRra08/UhlMlXEsH6H++9aKa/V
         YXHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SGeLvjZb2IE5c5c7lrllc0QjMVdEmMH6DY0p+fMngjw=;
        b=aKsm5xHQYvAsdz0s6dkGf+aqKR4HB13bWqjtVCmYNILqPv6UNGts8ZDPNEq2rm1o3C
         g/YIyUaq1YjyuJhbTh8lUcos/fuEvWrgfuS3bvj41WOXaov5RjE4JBD3IJWNv1hQ/had
         SblU3wJ+yk7H3TBtJr0BNc2L22cVZQK3HskkHMYFebrAY/eW0PxRPMa+0jo2K1zicyXw
         5AN08WKPqXIeDnLtgDcLXAwfcnwkFTUe7XH20jkXMt0NGFMBqUhTjryFXszfKyMhuHte
         urrLaf4AUOqUPcKEQWn6tAzzY/WQndmI7xVC61ibAou2T8bdv5lqGJB5r0xN0HRUl5ho
         gyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SGeLvjZb2IE5c5c7lrllc0QjMVdEmMH6DY0p+fMngjw=;
        b=XedzL+xWanKHMSqVDiboCKPsQpn72yeD6vPPC3M4kJoAkcSGFNITVfu6zHfa53b/sP
         wXI7bbXWWjTtFImd8TTLYloB6PvWiNSM9m6pgQecPd9O0bCnCjajjpQVuJ/mbXAwcJds
         fOuTQU6wQNvLcuuRmU5fxTAjiG9KwEJfptio8c7TPT1jgFd0x0/Prw9LO/PuK0whXqbT
         ymUumHDIztqNT1bS6XDWKzKZstOmm/7YSKuxhsghQlz8zweus24OLKcL84HQhVj8USFK
         Yqr6cbDqV9N1uxm4I8nZi3AB8eMXyMwDmyOCQ1cqZK1YNJSUomA+kkV77N+79BAbyP7J
         pspQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yF573gKzQFcjugWfm+auM8FP1sOg9Kf1yH6Hy3Ib84v7TDqvi
	xClCBcMNrre11HRQmKvKe8I=
X-Google-Smtp-Source: ABdhPJx3Wrz7Dj/QVr1qOD4ots9awHhuAB190Xjs+c+I7nKm76HglL6NDsa+BEYkligTr/YXC6vLGQ==
X-Received: by 2002:a05:6214:f2e:: with SMTP id iw14mr12264279qvb.21.1636299087649;
        Sun, 07 Nov 2021 07:31:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1aa5:: with SMTP id bl37ls141476qkb.9.gmail; Sun,
 07 Nov 2021 07:31:27 -0800 (PST)
X-Received: by 2002:a05:620a:298e:: with SMTP id r14mr12524638qkp.84.1636299086896;
        Sun, 07 Nov 2021 07:31:26 -0800 (PST)
Date: Sun, 7 Nov 2021 07:31:26 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
In-Reply-To: <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_328_1355236674.1636299086259"
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

------=_Part_328_1355236674.1636299086259
Content-Type: multipart/alternative; 
	boundary="----=_Part_329_1667983331.1636299086259"

------=_Part_329_1667983331.1636299086259
Content-Type: text/plain; charset="UTF-8"



> >Not sure how you ended up assigning that IP (i do not look at 
> >screenshots). But i guess your network setup is that you have one 
> >physical NIC which still belongs to the root cell. And you have a 
> >virtual network with two jailhouse shmem network adapters going between 
> >your non-root and root-cell. 
>
I assigned IP through command line. I have one physical NIC, yes you are 
right, but the I do not know how to access the virtual network. 

>
> >An i further guess that the non-root cell got its IP via its kernel 
> >cmdline. To hook that up to the root-cell, the root-cell will need an 
> >IP from the same subnet. And that additional subnet should not overlap 
> >with the subnet your root-cell is already using on the physical NIC. 

 
For instance, if the root cell has an IP of 192.168.0.100, I give the IP to 
the non-root cell of 192.168.0.101 

> >That way you should eventually be able to "ping" and "ssh" between root 
> >and non-root. What you might want to do later would be to create a 
> >bridge on the root-cell, where you would attach the physical NIC and 
> >the jailhouse-NIC ... that would connect you non-root cell to your LAN 
> >and allow for DHCP and external communication. 
>

> >Nothing jailhouse specific really, simple Linux networking stuff. The 
> >only thing really needed is the jailhouse NIC driver on the root cell, 
> >i assume a new NIC appeared after your "jailhouse enable" ... 
>
> I think I am missing something in this part, the command "ifconfig" 
returns the same NIC drivers [eth0-wlan0-lo] before and after jailhouse 
enable. May I ask where can I find information about Jailhouse NIC and how 
to embed it in the root cell. 

Best regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8dce9427-624f-4d62-b803-3ef00552e283n%40googlegroups.com.

------=_Part_329_1667983331.1636299086259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">&gt;Not sure how you ended up assigning that IP (i do not look at
<br>&gt;screenshots). But i guess your network setup is that you have one
<br>&gt;physical NIC which still belongs to the root cell. And you have a
<br>&gt;virtual network with two jailhouse shmem network adapters going bet=
ween
<br>&gt;your non-root and root-cell.
<br></blockquote><div>I assigned IP through command line. I have one physic=
al NIC, yes you are right, but the I do not know how to access the virtual =
network. <br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0=
 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>&gt;An i further guess that the non-root cell got its IP via its kernel
<br>&gt;cmdline. To hook that up to the root-cell, the root-cell will need =
an
<br>&gt;IP from the same subnet. And that additional subnet should not over=
lap
<br>&gt;with the subnet your root-cell is already using on the physical NIC=
.
</blockquote><div>&nbsp;<br></div><div>For instance, if the root cell has a=
n IP of 192.168.0.100, I give the IP to the non-root cell of 192.168.0.101 =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">&gt;That way =
you should eventually be able to "ping" and "ssh" between root
<br>&gt;and non-root. What you might want to do later would be to create a
<br>&gt;bridge on the root-cell, where you would attach the physical NIC an=
d
<br>&gt;the jailhouse-NIC ... that would connect you non-root cell to your =
LAN
<br>&gt;and allow for DHCP and external communication.=20
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0=
.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>&gt;Nothing jailhouse specific really, simple Linux networking stuff. T=
he
<br>&gt;only thing really needed is the jailhouse NIC driver on the root ce=
ll,
<br>&gt;i assume a new NIC appeared after your "jailhouse enable" ...
<br>
<br></blockquote><div>I think I am missing something in this part, the comm=
and "ifconfig" returns the same NIC drivers [eth0-wlan0-lo] before and afte=
r jailhouse enable. May I ask where can I find information about Jailhouse =
NIC and how to embed it in the root cell. <br></div><div><br></div><div>Bes=
t regards, <br>Moustafa Noufale<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8dce9427-624f-4d62-b803-3ef00552e283n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8dce9427-624f-4d62-b803-3ef00552e283n%40googlegroups.co=
m</a>.<br />

------=_Part_329_1667983331.1636299086259--

------=_Part_328_1355236674.1636299086259--
