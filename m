Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBUWI3D6QKGQEDMQAHKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0292B8C8F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 08:52:52 +0100 (CET)
Received: by mail-qv1-xf3d.google.com with SMTP id d41sf3882260qvc.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KxKDhUPa9Qk/23ktroTyveX872pmMXLTHWytQsAaxkg=;
        b=fBbCo6IGBrGd+C48d2eW9i/IWjW9Qv+QDKd7v8fppV8X6yqMJ+qHMNGIS7NqBWKS7G
         H7mHqaU0YycoREa3kXylSjCn1qUWejjEp0YdXAfoK9dqTxobWVcRVU4oC9Y450MghrZb
         0IkUlH/UNTCrbhWBCEVb/bdKFXKj/eUQd/y1b/TXgdYKRmMESy+wYLId8BEf69+to1mc
         0cIqfw60wy9bOb9x3V8JpPFUjQjbsu0D0wCHsIuRj1yLM+8RqfXh13lpDbd27XKl7Msy
         9bMA2bUYSRapotbnQujozFhec7V/eTSamIbJ+Rgo7XkNJDyrWOnI6LEYagTKunJktLnG
         nlww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KxKDhUPa9Qk/23ktroTyveX872pmMXLTHWytQsAaxkg=;
        b=IKvm12N5Nfs98sILl2ehXn8PvX1UwuUfBDVR8XJlZq8+vWXaZfLGLv2jFeqCQjMZE4
         OuJHE1FDg/hWhczyZr4T+W4tmP7v59AeLVP4oMZkt3Gt21tLL0oT79SybgtDqLbbnf/R
         Wm0mpmI4/vP6MEWz9zTFtmvwgyizt1stGTmcOzflOWTF5MEOYAtkQg318GQEVqWbKOVS
         1xDqahDD2OtkLQwr3B2dUTRl2NLEZ/tqjZew5LINBkeEbk9zUZCUKPNTVFgejjXDwI8k
         5kOL2w+7hoUQ5dGjUD6RDz8I1RzCjcHzWmyPMy/CjwgzbMLTS4OSfLJNUYTq5qVjbcfc
         mYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KxKDhUPa9Qk/23ktroTyveX872pmMXLTHWytQsAaxkg=;
        b=E0VZw4TjdYLB0yrX/bkgQsjpIcE4ceW93kfJFGuStl4j0bwcNIPwynE3jodAyP7/r0
         NFTSJzlLGQvuQrgYCbKhUMbllnujATV/4tSLmY8oCohhZMyjateCJa9gi6sRKHzs+fbI
         YVw+cz7n31Xpf9aCeXrLw3Znp+M8tCqzEuvH/fBCpGmLpS0AI1uWzmh48vIJg3QhEBTw
         Vq9bMZV/686GhRziAHsFv64zPHEvER0mrpDhvBBTWB2XiXV3eW1VosK0bwjVHc7AIWR2
         nUGGryoxn/dQQpA99Qr+HW/g4VWeYqd60gt8r1yE03OCdUCNPGYLjxrlWYI6rHAG9bfa
         OqXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531S9CqfwIycQR/l70JzIxiTYJyD2Khsk+z+3R2YQHbj+Te7Pykh
	WFU1lVQz7ky5Sa7f8ly8mtI=
X-Google-Smtp-Source: ABdhPJzHBGlYQV1nEbanFHOh2aqUFUoZQN8NBkXYsmh2vF5hWaTJoz2V+2yD6CJzQaDzdrpCfqTZMg==
X-Received: by 2002:a0c:e24e:: with SMTP id x14mr9591334qvl.13.1605772371181;
        Wed, 18 Nov 2020 23:52:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:9bd7:: with SMTP id d206ls967024qke.1.gmail; Wed, 18 Nov
 2020 23:52:50 -0800 (PST)
X-Received: by 2002:a37:951:: with SMTP id 78mr9729392qkj.47.1605772370491;
        Wed, 18 Nov 2020 23:52:50 -0800 (PST)
Date: Wed, 18 Nov 2020 23:52:49 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <581e32ac-d032-4108-b4fe-21286e6b2085n@googlegroups.com>
In-Reply-To: <9ea3bc46-677d-7e23-0bff-70d0218898da@siemens.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
 <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
 <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
 <9ea3bc46-677d-7e23-0bff-70d0218898da@siemens.com>
Subject: Re: one question about MSI-X support for vPCI
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1976_67493602.1605772369545"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_1976_67493602.1605772369545
Content-Type: multipart/alternative; 
	boundary="----=_Part_1977_447589062.1605772369545"

------=_Part_1977_447589062.1605772369545
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,

After some investigation, I found the root cause of the issue: the carrier=
=20
is not
changed to be on if we open virtual NIC in inmate firstly, attached patch=
=20
can
fix this issue, please help to review, by the way where I can upstream this=
=20
patch?
Thanks.

Best Regards,
Jiafei.

=E5=9C=A82020=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 =E4=B8=8B=E5=8D=886:01:51<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 18.11.20 10:50, Peter pan wrote:=20
> > Hi, Jan,=20
> >=20
> > I have one new issue and not sure it is a know issue.=20
> >=20
> > The issue is: when I ifconfig up ivshmem-net NIC in root cell firstly=
=20
> > and then ifconfig up ivshmem NIC in inmate cell (runing Linux),  I can=
=20
> > ping through between two NICs, but if I ifconfig up NIC in inmate cell=
=20
> > before ifconfig up the NIC in root cell, I can't ping through between=
=20
> > two NICs, and I found NIC in inmate can only receive packet sending fro=
m=20
> > root cell NIC, but NIC in root cell can't receive any packet and there=
=20
> > is also no irq received for ivshmem NIC.=20
> >=20
>
> The link states of both virtual NICs are up (ethtool)? Is there any=20
> ivshmem-net interrupt received at all on the root side? There should be=
=20
> a few during setup at least.=20
>
> Check that the interrupt line on the root side is really free, and also=
=20
> that GICD is properly intercepted by Jailhouse (check mappings).=20
>
> Jan=20
>
> --=20
> Siemens AG, T RDA IOT=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b2085n%40googlegroups.com.

------=_Part_1977_447589062.1605772369545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,<div><br></div><div>After some investigation, I found the root caus=
e of the issue: the carrier is not</div><div>changed to be on if we open vi=
rtual NIC in inmate firstly, attached patch can</div><div>fix this issue, p=
lease help to review, by the way where I can upstream this patch?</div><div=
>Thanks.</div><div><br></div><div>Best Regards,</div><div>Jiafei.</div><div=
><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">=E5=9C=A82020=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 =E4=B8=8B=E5=8D=886:01:51&lt;j.kiszka...@gmail.com&gt; =E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 =
0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">O=
n 18.11.20 10:50, Peter pan wrote:
<br>&gt; Hi, Jan,
<br>&gt;=20
<br>&gt; I have one new issue and not sure it is a know issue.
<br>&gt;=20
<br>&gt; The issue is: when I ifconfig up ivshmem-net NIC in root cell firs=
tly
<br>&gt; and then ifconfig up ivshmem NIC in inmate cell (runing Linux),&nb=
sp; I can
<br>&gt; ping through between two NICs, but if I ifconfig up NIC in inmate =
cell
<br>&gt; before ifconfig up the NIC in root cell, I can't ping through betw=
een
<br>&gt; two NICs, and I found NIC in inmate can only receive packet sendin=
g from
<br>&gt; root cell NIC, but NIC in root cell can't receive any packet and t=
here
<br>&gt; is also no irq received for ivshmem NIC.
<br>&gt;=20
<br>
<br>The link states of both virtual NICs are up (ethtool)? Is there any
<br>ivshmem-net interrupt received at all on the root side? There should be
<br>a few during setup at least.
<br>
<br>Check that the interrupt line on the root side is really free, and also
<br>that GICD is properly intercepted by Jailhouse (check mappings).
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b2085n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b2085n%40googlegroups.co=
m</a>.<br />

------=_Part_1977_447589062.1605772369545--

------=_Part_1976_67493602.1605772369545
Content-Type: text/x-diff; charset=US-ASCII; 
	name=0001-ivshmem-net-set-carrier-on-if-device-has-been-opened.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-ivshmem-net-set-carrier-on-if-device-has-been-opened.patch
X-Attachment-Id: 0ac1c116-8323-44d9-9399-87819492667e
Content-ID: <0ac1c116-8323-44d9-9399-87819492667e>

From 828eecf2c696410a30bfd7c5c7a0d384c4bec7c5 Mon Sep 17 00:00:00 2001
From: Jiafei Pan <Jiafei.Pan@nxp.com>
Date: Thu, 19 Nov 2020 15:34:47 +0800
Subject: [PATCH] ivshmem-net: set carrier on if device has been opened

When virtual NIC is opened in inmate firstly, and then
open virtual NIC in root cell, virtual NIC in inmate
can't transmit packets out. The roor cause of this
issue is although state has been changed to be RUN
in process of "open", but carrier need to set to be on
after state of peer is changed to be RUN, otherwise
network stack will not transmit packet to virtual NIC.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 drivers/net/ivshmem-net.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index 18d5a15dbec2..8aab21b3febe 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -623,6 +623,12 @@ static void ivshm_net_state_change(struct work_struct *work)
 			netif_carrier_off(ndev);
 			ivshm_net_do_stop(ndev);
 		}
+		/* In case of it has been already opened, so state is RUN,
+		 * set Carrier on when remote goes to RUN.
+		 */
+		if (peer_state == IVSHM_NET_STATE_RUN)
+			netif_carrier_on(ndev);
+
 		break;
 	}
 
-- 
2.17.1


------=_Part_1976_67493602.1605772369545--
