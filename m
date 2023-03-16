Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBLPPZWQAMGQEMBAJWMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id C75936BD9E3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 21:10:22 +0100 (CET)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-544b71b3114sf15257087b3.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1678997421;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjCAOCg6KedkyxSq9S6vM5RKmX1NdDIg/AU/MkPfa98=;
        b=gucZG7PCYVVlC/owdVzt4VSOjvimGv4nuV8isn4Bftzc+Wa71vw26K111jj8YbzHlA
         5bqaiXDNzg+1x9CHL0noW9VMD2DZMXE4BZ/TJ0omQwHEXH2deO28Dh8QxxvmwKnP0TH4
         y98G7Pt0wdX8cE1qlA69YUAwGmNbeu3YVDw81iFsBVleGfXNlywxNTt35mgb31cEMGAW
         wZ9eKWvSpduHPI0JrNfSvAD8OnfMKgHQzBEOpxSzAd0KDe3Nszzcs0AgMruu3RCcxpwK
         /K1jnUGXL2r9yRByRBBmXjlR5z/fCSH6DFqfy7+5rV5aj2u/Kx0TePNUfZo4R1AVMuu9
         yGqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678997421;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjCAOCg6KedkyxSq9S6vM5RKmX1NdDIg/AU/MkPfa98=;
        b=X5XYdUPZ9GN2eSUe8p/Z6Qq6Q4PvbKyBl+RKzpesJ9RPl0IDQZh9QYgaKAhreNCl1K
         UhiTbV4RlHjU8xfsMKAHBEkDcegW7pP99BgeysTi6UWb5eK3sb0JCx2YCxZuX4a8yXa1
         EFjmI5aXmOWCh5LUStCmOd8jIuy4ur2Z4nQVGPyN6buqIrLE9oyLdw96V2LhT6OT4mmF
         gl3wRp/W2G828V3xmJs1CJOb8mLttQiGSWWKbeKdcVc16SC8tc8utG055/QQgYN6ztOw
         3j5GFwX61dh1/rwlzXyFv6aoyhoZb56cov/er/ZpFaIIvk20raXQtLqotji/V4HyUbPQ
         HhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678997421;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjCAOCg6KedkyxSq9S6vM5RKmX1NdDIg/AU/MkPfa98=;
        b=J7G7QzRYipVnHr6n5pQe7TpKIoEo9k6AflUGaWsztqP505vf3PabwTgW1rRFL3oWJ6
         r7Q/h54mJWB7PGS4Q7lIYNNTvG+Sp1DdPDXelhvN+h2DoReRx9QsCyKa/ifCMClbIkAp
         3eM1ocmISenYhWCoUFy029t+2lv6wb2X38vMMkTMAAGq1wr3Zut6ZsNSIkSYjkiBSniz
         vOwiLJBXIx8G8ZFu40Q1QGkGU7jIpYtb9ickeEyxAAW1hEa3TQGAYN1iRXpt07YWOeWQ
         zGSBoyP8b8VBgm7kDpg47MdB5ntyB2KQqxsOISQK2S+ugiaFVU+tx4VMawFcYhGQiieK
         vR8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXxAxkWo7a8FRyw0sInM05TGJuX8oY9bN55btMk2X2yh0EeHWvx
	+MmmvJ5xlsR6l0Fxua6kUKY=
X-Google-Smtp-Source: AK7set/lwYRG324zc1HgoQsaVz5OVbbRCzqouBGLll+5J/k3fzNvIm4axl4tATE56teJfDRnOUnoWw==
X-Received: by 2002:a81:4302:0:b0:541:7266:3fd7 with SMTP id q2-20020a814302000000b0054172663fd7mr2923832ywa.3.1678997421639;
        Thu, 16 Mar 2023 13:10:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:d8f:b0:52f:3dfb:b256 with SMTP id
 da15-20020a05690c0d8f00b0052f3dfbb256ls1350890ywb.1.-pod-prod-gmail; Thu, 16
 Mar 2023 13:10:20 -0700 (PDT)
X-Received: by 2002:a81:ad1a:0:b0:52f:184a:da09 with SMTP id l26-20020a81ad1a000000b0052f184ada09mr440691ywh.2.1678997420527;
        Thu, 16 Mar 2023 13:10:20 -0700 (PDT)
Date: Thu, 16 Mar 2023 13:10:19 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69128f39-6571-4eaa-8039-e7fe39afb7ecn@googlegroups.com>
In-Reply-To: <f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n@googlegroups.com>
References: <f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n@googlegroups.com>
Subject: Re: issue with VNIC for 2nd NR-Linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2136_2104368244.1678997419944"
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

------=_Part_2136_2104368244.1678997419944
Content-Type: multipart/alternative; 
	boundary="----=_Part_2137_280419132.1678997419944"

------=_Part_2137_280419132.1678997419944
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, it has turned out that all I needed to do to get the network=20
access for the 2nd NR-Linix cell was to assign IPs for different subnets to=
=20
my root<->non-root VNICs pairs, e.g. 192.168.0.* to one and 192.168.1.* to=
=20
the other.

Best Regards,

Yelena

On Thursday, March 16, 2023 at 4:07:30=E2=80=AFPM UTC Yelena Konyukh wrote:

>
> Hi All,
>
> I would be very grateful for any comments on the issue described below:
>
> I have Jailhouse setup on ARM64 platform with Zynq SoC, where I have 2=20
> Non-Root Linux cells. I need to provide network access for both NR-Linux=
=20
> cells.=20
> To achieve that, I have configured the root cell to have 2 VNICs - one fo=
r=20
> NR-Linux cell 1 (on .bdf 0<<3)  and one for NR-Linux cell 2 (on .bdf << 1=
).=20
>
> While network comms between the root and the cell 1 work fine (cells ping=
=20
> each other, cell 1  can use the root as a router and get external network=
=20
> access), network comms between the root and cell 2 do not work.
>
> Initially, I expected it to be an issue with the VNIC's interrupt in cell=
=20
> 2. That does not seem to be the case. When cell 2 starts ( Linux is=20
> booted), the count on the corresponding IRQ line is 6. What I've found so=
=20
> far, is that when I ping the cell 2 from the root, no ivshm_net_xmit() is=
=20
> invoked on the root as a result of the ping.=20
>
> I expected ivshm_net_xmit() to be invoked, because it looks to me this is=
=20
> how an interrupt is raised to a NR-Linux cell:
> ivshm_net_xmit()->ivshm_net_notify_tx()->write to the relevant doorbell=
=20
> register->an interrupt is raised on the peer.
>
> Funnily enough, if I move my NR-Linux cell 2 to use .bdf 0, rather than=
=20
> 1<<3, or leave it to use 1<<3, but have only one VNIC in the root, then m=
y=20
> cell 2 gets network access...
>
> Has anyone seen anything similar?
> Or could give any pointers of what might be going wrong?
> Has anyone managed to have network access for > 1 NR-Linux cell on ARM64?
>
> I could share my code and logs, if that could help anyone help me :).
>
> Thank you very much in advance.
>
> Best Regards,
>
> Yelena
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/69128f39-6571-4eaa-8039-e7fe39afb7ecn%40googlegroups.com.

------=_Part_2137_280419132.1678997419944
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, it has turned out that all I needed to do to get the network acce=
ss for the 2nd NR-Linix cell was to assign IPs for different subnets to my =
root&lt;-&gt;non-root VNICs pairs, e.g. 192.168.0.* to one and 192.168.1.* =
to the other.<br /><br />Best Regards,<br /><br />Yelena<br /><br /><div cl=
ass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, Mar=
ch 16, 2023 at 4:07:30=E2=80=AFPM UTC Yelena Konyukh wrote:<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;"><br>Hi All,<br><br>I would b=
e very grateful for any comments on the issue described below:<br><br>I hav=
e Jailhouse setup on ARM64 platform with Zynq SoC, where I have 2 Non-Root =
Linux cells. I need to provide network access for both NR-Linux cells. <br>=
To achieve that, I have configured the root cell to have 2 VNICs - one for =
NR-Linux cell 1 (on .bdf 0&lt;&lt;3)=C2=A0 and one for NR-Linux cell 2 (on =
.bdf &lt;&lt; 1). <br><br>While network comms between the root and the cell=
 1 work fine (cells ping each other, cell 1=C2=A0 can use the root as a rou=
ter and get external network access), network comms between the root and ce=
ll 2 do not work.<br><br>Initially, I expected it to be an issue with the V=
NIC&#39;s interrupt in cell 2. That does not seem to be the case. When cell=
 2 starts ( Linux is booted), the count on the corresponding IRQ line is 6.=
 What I&#39;ve found so far, is that when I ping the cell 2 from the root, =
no ivshm_net_xmit() is invoked on the root as a result of the ping. <br><br=
>I expected ivshm_net_xmit() to be invoked, because it looks to me this is =
how an interrupt is raised to a NR-Linux cell:<br>ivshm_net_xmit()-&gt;ivsh=
m_net_notify_tx()-&gt;write to the relevant doorbell register-&gt;an interr=
upt is raised on the peer.<br><br>Funnily enough, if I move my NR-Linux cel=
l 2 to use .bdf 0, rather than 1&lt;&lt;3, or leave it to use 1&lt;&lt;3, b=
ut have only one VNIC in the root, then my cell 2 gets network access...<br=
><br>Has anyone seen anything similar?<br>Or could give any pointers of wha=
t might be going wrong?<br>Has anyone managed to have network access for &g=
t; 1 NR-Linux cell on ARM64?<br><br>I could share my code and logs, if that=
 could help anyone help me :).<br><br>Thank you very much in advance.<br><b=
r>Best Regards,<br><br>Yelena<br><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69128f39-6571-4eaa-8039-e7fe39afb7ecn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69128f39-6571-4eaa-8039-e7fe39afb7ecn%40googlegroups.co=
m</a>.<br />

------=_Part_2137_280419132.1678997419944--

------=_Part_2136_2104368244.1678997419944--
