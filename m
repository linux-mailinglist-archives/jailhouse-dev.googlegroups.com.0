Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBQMB32PQMGQEUTHOLEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A466A0C7A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Feb 2023 16:05:39 +0100 (CET)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-536a4eba107sf147145897b3.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Feb 2023 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Rs8Mw79wYKw5Ra1uGxOSKcsTl9ZfD+PaUVp6qVqgBY=;
        b=kabrVYs6SsU0sQbslFPm8PXWnyGuGb5/7En9RqYnanA61/p/mNG4wmWIWtDQ4sspfx
         ydvc+94+PN/E9hWYQQnqHxsv+B7Rw25gMouw0aK9Laxz2WRHHiwcMo9wxKlnht7Y+rvK
         XUWdy9v+bjr5/3zUYX6Dad0NrfBuoruW/ML/Hst6sdwstkGDIXD74TF44hHruxZu1IES
         NGOBb5ksW39tOIx2SU5r7KUgAbGdgwfw2WWNUBKpXZkeUHIRlj5gsnWZ0IZzPBBfqMC7
         a3BnuRCdKCwOcgbkxU8W25PqhXhIro2tuLDSQlwATcObZtFC7hz+fMFQraBMMMlEtJnU
         B99Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rs8Mw79wYKw5Ra1uGxOSKcsTl9ZfD+PaUVp6qVqgBY=;
        b=SwFOupLZUj+2KTOy90vgaWOerrrUCUOLGHcT87PEx9sUEOhFz4qF09bTQXTaVdYZLf
         +yRxo7Ub71wkwuBWlS3UztcyvV1g0e81L8Pj7RKL8gFHI5tChvfxFI8poDhPf/PxniaR
         gVqkT9xw0022ZvUJ3VskAzO0FHc8IpVjXLNZ9qdTGNNYpZPchxZxusU601/g4eWEH8Fz
         KGXyF865yQXU2ZA8w6bkeKzC1S6ose4QgkkPByeilgGtlZAFdQjnS2DybxK4IxHFN2li
         80qkU1qSl70/PZYVDP6UUAm80xXMY8YFDD+IfnO33CPSymyo3HbUpNeajWi+7/rTuRio
         Qd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rs8Mw79wYKw5Ra1uGxOSKcsTl9ZfD+PaUVp6qVqgBY=;
        b=ee45M9clRpy9F/ojGhEbQeWckojHPekq7ZH7UfSW2jHJjGvgN8TaKunbkTezZcE7AQ
         SoK3EGLbUAZyXTd9I+ahUjb439Oy2FtoQnlPw9GpNf12cRsKsNQWGe12+32vMfqRSt3U
         UirO1/iSTmvYD97ajCyCNOp8tuiWROcKGVJxyY0ZtgRIbhFN3HTsrywokYAqmBMmEVNV
         NREcl6XZCvgU+jEJtcXhQffCd+4+rfth98IZ295UtQwtCxmwcpWmNDD/2syJ7dkSdi0S
         p3A3yvXkBJ2peCo3tT246ZXNHy+TLbT6PFTIPSDtxA2hA8crH+UHo2Mn7f8NQFMqHV9N
         aVjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUGpfs3jaO7ZJ+mH1Ob57edGKGEXk1BE8XMWcLPCGJzQ9oXbdD3
	U/C5Bl5oS9NzxqMftLkYM9A=
X-Google-Smtp-Source: AK7set+9ye6AqzcuhyDum+EZ9DkcLoA6kB7opTwbiGH6zs9iWLp38eWC0/fAeY+2HTre0RiGDZ2tkw==
X-Received: by 2002:a81:ae10:0:b0:52e:dddf:82b9 with SMTP id m16-20020a81ae10000000b0052edddf82b9mr2345585ywh.10.1677164737708;
        Thu, 23 Feb 2023 07:05:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:74e:0:b0:52e:eb33:90c6 with SMTP id 75-20020a81074e000000b0052eeb3390c6ls5077550ywh.9.-pod-prod-gmail;
 Thu, 23 Feb 2023 07:05:36 -0800 (PST)
X-Received: by 2002:a81:ad22:0:b0:52e:fb7a:94b7 with SMTP id l34-20020a81ad22000000b0052efb7a94b7mr2414205ywh.7.1677164736363;
        Thu, 23 Feb 2023 07:05:36 -0800 (PST)
Date: Thu, 23 Feb 2023 07:05:35 -0800 (PST)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c2344328-236a-4ec8-b713-9b04df0735c1n@googlegroups.com>
In-Reply-To: <c7248484-26a9-b284-ad20-3ed41eacdc7e@oth-regensburg.de>
References: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
 <c7248484-26a9-b284-ad20-3ed41eacdc7e@oth-regensburg.de>
Subject: Re: Root cell "loses" the IP on the virtual network interface
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1490_449488388.1677164735650"
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

------=_Part_1490_449488388.1677164735650
Content-Type: multipart/alternative; 
	boundary="----=_Part_1491_489385809.1677164735650"

------=_Part_1491_489385809.1677164735650
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Thank you very much for replying.

Yes, my issue appears to be due to using "ifconfig".
The IP does not get lost since I have configured the virtual network=20
interface via a file in /etc/network/interfaces.d as below:
/etc/network/interfaces.d# cat enP1p0s1
allow-hotplug enP1p0s1=20
iface enP1p0s1 inet static
address 192.168.0.1
netmask 255.255.255.0

Thank you agai.

Best Regards,

Yelena

On Wednesday, February 22, 2023 at 3:27:10 PM UTC Ralf Ramsauer wrote:

> Hi Yelena,
>
> On 21/02/2023 18:23, Yelena Konyukh wrote:
> >=20
> > Hi All,
> >=20
> > I would be very grateful for any comments on the following issue:
> >=20
> > I run Jailhouse on an arm64 platform with Xilinx kernel. I use=20
> > ivshmem-net driver and the relevant cells and .DTBs configurations to=
=20
> > support a virtual network interface in my root cell and my non-root=20
> > Linux cell.
> >=20
> > Generally speaking, everything works quite well - the virtual network=
=20
> > interfaces communicate with each other and, once I have setup my root=
=20
> > cell, which also has a physical network interface, to act as a router=
=20
> > for my non-root Linux, my non-root cell has access to the external=20
> network.
> >=20
> > However, I noticed that sometimes the IP which I setup on the root=20
> > cell's virtual interface gets "lost". That is  - I assign an IP with=20
> > ifconfig to the virtual NIC and after a period of time (sometimes it=20
> > takes > 1 minute) the IP is no longer there. I keep re-setting the IP=
=20
> > and eventually it "sticks"...
> > At some point I thought it is setting the IP on the root's NIC after
> > netif_carrier_on() is invoked for the root's NIC that makes the IP=20
> > "stick", but it now looks like it is not the case and I no longer have=
=20
> > any clue as to what causes the IP "stick".
>
> Uhm, what distribution do you use for your root-cell?
>
> Unless the NIC state doesn't change over time (which could explain the=20
> loss of the IP) it sounds to me like there is some Network Configuration=
=20
> Application that grabs the interface as soon as it exists and tries to=20
> reconfigure it. Then it maybe tries to DHCP on the interface and the IP=
=20
> is lost. Something like NetworkManager, systemd-networkd, =E2=80=A6 Is th=
ere any=20
> of those applications running in your root cell?
>
> Ralf
>
> >=20
> > Has anyone seen anything similar?
> > Any comments would be very much appreciated.
> >=20
> > Thank you
> >=20
> > Best Regards,
> >=20
> > Yelena
> >=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40googlegroups.com.

------=_Part_1491_489385809.1677164735650
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<br /><br />Thank you very much for replying.<br /><br />Yes, my is=
sue appears to be due to using "ifconfig".<br />The IP does not get lost si=
nce I have configured the virtual network interface via a file in /etc/netw=
ork/interfaces.d as below:<br />/etc/network/interfaces.d# cat enP1p0s1<br =
/>allow-hotplug enP1p0s1 <br />iface enP1p0s1 inet static<br />address 192.=
168.0.1<br />netmask 255.255.255.0<br /><br />Thank you agai.<br /><br />Be=
st Regards,<br /><br />Yelena<br /><br /><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Wednesday, February 22, 2023 at 3:27:10 =
PM UTC Ralf Ramsauer wrote:<br/></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddi=
ng-left: 1ex;">Hi Yelena,
<br>
<br>On 21/02/2023 18:23, Yelena Konyukh wrote:
<br>&gt;=20
<br>&gt; Hi All,
<br>&gt;=20
<br>&gt; I would be very grateful for any comments on the following issue:
<br>&gt;=20
<br>&gt; I run Jailhouse on an arm64 platform with Xilinx kernel. I use=20
<br>&gt; ivshmem-net driver and the relevant cells and .DTBs configurations=
 to=20
<br>&gt; support a virtual network interface in my root cell and my non-roo=
t=20
<br>&gt; Linux cell.
<br>&gt;=20
<br>&gt; Generally speaking, everything works quite well - the virtual netw=
ork=20
<br>&gt; interfaces communicate with each other and, once I have setup my r=
oot=20
<br>&gt; cell, which also has a physical network interface, to act as a rou=
ter=20
<br>&gt; for my non-root Linux, my non-root cell has access to the external=
 network.
<br>&gt;=20
<br>&gt; However, I noticed that sometimes the IP which I setup on the root=
=20
<br>&gt; cell&#39;s virtual interface gets &quot;lost&quot;. That is=C2=A0 =
- I assign an IP with=20
<br>&gt; ifconfig to the virtual NIC and after a period of time (sometimes =
it=20
<br>&gt; takes &gt; 1 minute) the IP is no longer there. I keep re-setting =
the IP=20
<br>&gt; and eventually it &quot;sticks&quot;...
<br>&gt; At some point I thought it is setting the IP on the root&#39;s NIC=
 after
<br>&gt; netif_carrier_on() is invoked for the root&#39;s NIC that makes th=
e IP=20
<br>&gt; &quot;stick&quot;, but it now looks like it is not the case and I =
no longer have=20
<br>&gt; any clue as to what causes the IP &quot;stick&quot;.
<br>
<br>Uhm, what distribution do you use for your root-cell?
<br>
<br>Unless the NIC state doesn&#39;t change over time (which could explain =
the=20
<br>loss of the IP) it sounds to me like there is some Network Configuratio=
n=20
<br>Application that grabs the interface as soon as it exists and tries to=
=20
<br>reconfigure it. Then it maybe tries to DHCP on the interface and the IP=
=20
<br>is lost. Something like NetworkManager, systemd-networkd, =E2=80=A6 Is =
there any=20
<br>of those applications running in your root cell?
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Has anyone seen anything similar?
<br>&gt; Any comments would be very much appreciated.
<br>&gt;=20
<br>&gt; Thank you
<br>&gt;=20
<br>&gt; Best Regards,
<br>&gt;=20
<br>&gt; Yelena
<br>&gt;=20
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/e647559=
a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-=
692b8495f9ban%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16772507177=
82000&amp;usg=3DAOvVaw2fDnB34Tcfzqq_xqDXwntg">https://groups.google.com/d/m=
sgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/e647559=
a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
677250717782000&amp;usg=3DAOvVaw1WeW_7CC-mmKhLUgBf8MPw">https://groups.goog=
le.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40googlegroups.co=
m</a>.<br />

------=_Part_1491_489385809.1677164735650--

------=_Part_1490_449488388.1677164735650--
