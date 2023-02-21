Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBMP42OPQMGQEEHVKW4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1069E5E1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Feb 2023 18:24:02 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id x35-20020a25a026000000b009433a21be0dsf3731506ybh.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Feb 2023 09:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdeUG3/rlPA5oIF5u6AUBJ65M00x/QVzXRHtjA/dza8=;
        b=Ez53DjxXhQbv/ZnHJscNknCxSXeATFB/hP2cayO+AB2/7eWgkiQ0EoQR8M91pHhsm6
         +Pai742ru27nqXJTzHnYVw8hmkvwGwZCr1FB59QazYHZc8Ake+B65R0QzAxZ+uebrNqp
         J4jGe0tsAjyAOrSYK3F08KZwLOoSffAJYcMEXVID5WDWLq6hUJz2hh/blf1KuGioKCpT
         LUv2ejsT9SbDF/uE4g4n/hOivrRpqwJ7fwCQOt+AGkWXlac+zFuM9VgCSr7LattcX43f
         /w0Js91SURdKWvMrEGqe/7GImfqBIHgQ1pgKp7pXFPgIeh+a2UsCo+grIEAnnDMUDAGh
         vzqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdeUG3/rlPA5oIF5u6AUBJ65M00x/QVzXRHtjA/dza8=;
        b=HjUmjQ//3FrC3z+MlH7qbN6O2PEiVaa+yE6cD09dzuSOo7B1XY1booROeISBITKkTu
         pGQLxz3cHBOH5O5LWKRwwuR1s4yNMcqHdGomM3LyYAnGFOFUsMU86q2YqfclzIqv60bi
         PF/ZAKhNJoMX+29jMn/gh1FJ6ShIjB8Fvnz/apH1cNHNqdxZzZn9nGNLQLTh45YxrYr6
         5o5cI6vKnu9VuHtPiEyW22Rdqm6t37ZW7wTUIbgLe384NFgFvWGSmvJpLVUb1hU12pXt
         qF29GN6mSWB51Woo1XAHkZR6fZi9tsRk5RuSMfDkFUxfoKdZl6xsKg+ntSjm7/6AX118
         Xgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdeUG3/rlPA5oIF5u6AUBJ65M00x/QVzXRHtjA/dza8=;
        b=EZ3ItANFvz6+qni0S9VUOsaA64jdIWIdukGpFN36IZ6kCe6j6yUdLLAGzrDfzcMyLY
         koTB+5Ut9oflOibJPGFCeK1NbcbnkpvY5nUV/PhY8geDB99vV5bvxqi7KyE1HBQ1Hjdq
         QrwNDaLYfveikzCvQRtvjneD1vj/BW7QcpkkICdGXRzx/wu1Jip+JFwdRZm/MZN5YLXX
         vqZWNuUcaPON20n6VxkNGT3k91AAxX+hUVTaxWuLMedMTyqFvLGJ9NaOBaJ1pYqUUK92
         hyc5r7BlrK2EuDilQHH6fbM1TK4XQaMntLlkiyYle+gH1KCnUNGLrD/2TRyanGC/CPX/
         D7ZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUs4e6NLj5FLuIn1FizIXhb5d22J/ctQcRxr9gPwI6YFiLVWFMw
	Cyo5NBior0wyz5xZnhKjti0=
X-Google-Smtp-Source: AK7set9Uh+SIUeSw0rYdDP86VEDsCQTl/x38ana6NjU0PHtShti0s7Hmy00r5fIICBsJk17NIkED1Q==
X-Received: by 2002:a81:7b84:0:b0:524:8c7a:51d4 with SMTP id w126-20020a817b84000000b005248c7a51d4mr2575656ywc.51.1677000241611;
        Tue, 21 Feb 2023 09:24:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ad28:0:b0:9a0:d4d:5471 with SMTP id y40-20020a25ad28000000b009a00d4d5471ls2723309ybi.0.-pod-prod-gmail;
 Tue, 21 Feb 2023 09:24:00 -0800 (PST)
X-Received: by 2002:a05:6902:143:b0:9a0:3e15:d45b with SMTP id p3-20020a056902014300b009a03e15d45bmr653905ybh.27.1677000240469;
        Tue, 21 Feb 2023 09:24:00 -0800 (PST)
Date: Tue, 21 Feb 2023 09:23:59 -0800 (PST)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
Subject: Root cell "loses" the IP on the virtual network interface
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4192_401128679.1677000239917"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_4192_401128679.1677000239917
Content-Type: multipart/alternative; 
	boundary="----=_Part_4193_617294062.1677000239917"

------=_Part_4193_617294062.1677000239917
Content-Type: text/plain; charset="UTF-8"


Hi All,

I would be very grateful for any comments on the following issue:

I run Jailhouse on an arm64 platform with Xilinx kernel. I use ivshmem-net 
driver and the relevant cells and .DTBs configurations to support a virtual 
network interface in my root cell and my non-root Linux cell.

Generally speaking, everything works quite well - the virtual network 
interfaces communicate with each other and, once I have setup my root cell, 
which also has a physical network interface, to act as a router for my 
non-root Linux, my non-root cell has access to the external network.

However, I noticed that sometimes the IP which I setup on the root cell's 
virtual interface gets "lost". That is  - I assign an IP with ifconfig to 
the virtual NIC and after a period of time (sometimes it takes > 1 minute) 
the IP is no longer there. I keep re-setting the IP and eventually it 
"sticks"...
At some point I thought it is setting the IP on the root's NIC after 
netif_carrier_on() is invoked for the root's NIC that makes the IP "stick", 
but it now looks like it is not the case and I no longer have any clue as 
to what causes the IP "stick".

Has anyone seen anything similar?
Any comments would be very much appreciated.

Thank you

Best Regards,

Yelena


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com.

------=_Part_4193_617294062.1677000239917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Hi All,<br /><br />I would be very grateful for any comments on the f=
ollowing issue:<br /><br />I run Jailhouse on an arm64 platform with Xilinx=
 kernel. I use ivshmem-net driver and the relevant cells and .DTBs configur=
ations to support a virtual network interface in my root cell and my non-ro=
ot Linux cell.<br /><br />Generally speaking, everything works quite well -=
 the virtual network interfaces communicate with each other and, once I hav=
e setup my root cell, which also has a physical network interface, to act a=
s a router for my non-root Linux, my non-root cell has access to the extern=
al network.<br /><br />However, I noticed that sometimes the IP which I set=
up on the root cell's virtual interface gets "lost". That is=C2=A0 - I assi=
gn an IP with ifconfig to the virtual NIC and after a period of time (somet=
imes it takes &gt; 1 minute) the IP is no longer there. I keep re-setting t=
he IP and eventually it "sticks"...<br /><div>At some point I thought it is=
 setting the IP on the root's NIC after <br /></div><div>netif_carrier_on()=
 is invoked for the root's NIC that makes the IP "stick", but it now looks =
like it is not the case and I no longer have any clue as to what causes the=
 IP "stick".<br /><br />Has anyone seen anything similar?<br />Any comments=
 would be very much appreciated.<br /><br />Thank you<br /><br />Best Regar=
ds,<br /><br />Yelena<br /></div><div><br /></div><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.co=
m</a>.<br />

------=_Part_4193_617294062.1677000239917--

------=_Part_4192_401128679.1677000239917--
