Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBRUIZWQAMGQELKEI2UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE986BD59E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 17:31:05 +0100 (CET)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-536a4eba107sf20742027b3.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1678984262;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZ47DsRdwmlYrXcln/WN/snhYnFo9AKgMzPI4gcuN0s=;
        b=elabWHJo47Gga9KbaUpy8ZMyktPWHZkYikr/QbAlusCrpZjdDKTef7qveVXMAdlhrX
         5yg+3P50DFiK2eR0GjZEQdaf5XNmNQzC2TXvCSRulPGj0Iu3l+2ClcelcsPIOE+MpuUi
         Ig9inpmRu931kh2AewOPQCuRzauQzqr4yEct3Az6yFdMzKLKWchls8Yy9sX4k8q8AbyE
         tjllOSevdZiup0GN25LHBxlP898WZiQZByt89S6ukKeryox2Xhbz0C7/b10hQjzVF2Dx
         3SN3qX/DEldVose+xBNo4grJwbJGNwqbKwOkkCsDjaGry7nyp9BN3Cp6RviBZjlfu98F
         jKiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678984262;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ47DsRdwmlYrXcln/WN/snhYnFo9AKgMzPI4gcuN0s=;
        b=ZGM9Rqr8YpoAhDgax3Q+G975yvrKkNLgyIV7nK+FAr+7QT1cceHBBRpiQezvDfkfIy
         hyn8IX5cv8qJBI5P0okS64X3JbpG+PBhGFhPBxS0T0jqy3ejnE4rvJ0bUH2S6DyE1aoz
         xIPNkp7g0686EVIUj70YwmRdMhmEnFHGC8yNzDI007fcnkSWhuKj33JZu/SQuHI+gTdi
         P8h/Oob1TV6hrmlmrcp/qOmz4Gp9Y3z1vp02Cb7e834D71D4795RjWQV04QWs9LDXlnN
         8DCEmlC5Fua8MaQypHzsT/jIPsAMAa+wPoVThC/0bdBAKAzu7ZXpLmXc1U/zi+LoHRx1
         Ompg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678984262;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ47DsRdwmlYrXcln/WN/snhYnFo9AKgMzPI4gcuN0s=;
        b=OcINEm+wnePZIAKz0Zyz5ZDvSEdN2rV0sx0FoCj7IjV1tJYvWcEP8zgc7uMwIpINcN
         kqLl5L9QhCSD/1uQdk8U1QeKAepBAtCOhU6XyUwwuRta0Zts3TGxTEyUvFtSFaTayvdQ
         ZJeGCVetiy5cdLwMGc71p0iMcwRq7u83p0TMol6YrMIHaIflhjyjvk6capOdttAUEQgi
         +zug0YIR2NbD1CLfBKh27WhODjVlW2lWZonDvyXKrLgF/Uzmn9LTmMGsaDgikCH0FNUI
         cdfvD8FEoL2O6aAMGSFHzXHRyTLwoPIfexooJS8kU4DEvoR8lWnbnskyNwvCwocegdp+
         FS+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUcbAY8YCAJZQAbpEKX28SOAPAsgZh/pjd3phzYnVbLk9QoPGop
	ItAKcD3Z7TqEtAeznD+0oV8=
X-Google-Smtp-Source: AK7set/spTe2EfRTbZSsVejG2RPvHzFwKlge+ImOumuq0xqSketEMpk6vZiU8jbq6OV3UddwCifUQw==
X-Received: by 2002:a25:fe04:0:b0:b1a:64ba:9c9b with SMTP id k4-20020a25fe04000000b00b1a64ba9c9bmr16749977ybe.1.1678984262585;
        Thu, 16 Mar 2023 09:31:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:41cb:0:b0:b32:32f7:8ee7 with SMTP id o194-20020a2541cb000000b00b3232f78ee7ls1171299yba.2.-pod-prod-gmail;
 Thu, 16 Mar 2023 09:31:01 -0700 (PDT)
X-Received: by 2002:a25:f904:0:b0:b27:65ca:f35d with SMTP id q4-20020a25f904000000b00b2765caf35dmr16787658ybe.5.1678984261386;
        Thu, 16 Mar 2023 09:31:01 -0700 (PDT)
Date: Thu, 16 Mar 2023 09:31:00 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <71b6a090-1673-4371-bfde-da0445357825n@googlegroups.com>
In-Reply-To: <751fa785-0438-dfdd-c5aa-86ccee76cb34@oth-regensburg.de>
References: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
 <c7248484-26a9-b284-ad20-3ed41eacdc7e@oth-regensburg.de>
 <c2344328-236a-4ec8-b713-9b04df0735c1n@googlegroups.com>
 <751fa785-0438-dfdd-c5aa-86ccee76cb34@oth-regensburg.de>
Subject: Re: Root cell "loses" the IP on the virtual network interface
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1648_526037506.1678984260693"
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

------=_Part_1648_526037506.1678984260693
Content-Type: multipart/alternative; 
	boundary="----=_Part_1649_707323196.1678984260693"

------=_Part_1649_707323196.1678984260693
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Thank you very much for trying to help and apologies for not replying=20
earlier.

Your guess about a network app trying to reconfigure my VNIC was correct.
When I stopped using ifconfig for setting an IP on my VNIC and used config.=
=20
files in /etc/network/interfaces.d instead, the issue got resolved - I no=
=20
longer "lose" the IP on the VNIC.
It must have been the NetworkManager that tried to reconfigure the VNIC,=20
just as you have suggested.
Sorry for not making it clearer in my previous message.

Best Regards,

Yelena

On Thursday, February 23, 2023 at 4:46:48=E2=80=AFPM UTC Ralf Ramsauer wrot=
e:

>
>
> On 23/02/2023 16:05, Yelena Konyukh wrote:
> > Hi Ralf,
> >=20
> > Thank you very much for replying.
> >=20
> > Yes, my issue appears to be due to using "ifconfig".
> > The IP does not get lost since I have configured the virtual network=20
> > interface via a file in /etc/network/interfaces.d as below:
> > /etc/network/interfaces.d# cat enP1p0s1
> > allow-hotplug enP1p0s1
> > iface enP1p0s1 inet static
> > address 192.168.0.1
> > netmask 255.255.255.0
>
> Okay, and once the interface appears (i.e., when jailhouse is enabled),=
=20
> the IP is set, and after you while, you loose it. Do I get that right?
>
> Does dmesg give you any hints why the interface goes down? What about=20
> the interface in the non-root cell? Do you have the same issue there?
>
> Thanks
> Ralf
>
> >=20
> > Thank you agai.
> >=20
> > Best Regards,
> >=20
> > Yelena
> >=20
> > On Wednesday, February 22, 2023 at 3:27:10 PM UTC Ralf Ramsauer wrote:
> >=20
> > Hi Yelena,
> >=20
> > On 21/02/2023 18:23, Yelena Konyukh wrote:
> > >
> > > Hi All,
> > >
> > > I would be very grateful for any comments on the following issue:
> > >
> > > I run Jailhouse on an arm64 platform with Xilinx kernel. I use
> > > ivshmem-net driver and the relevant cells and .DTBs
> > configurations to
> > > support a virtual network interface in my root cell and my non-root
> > > Linux cell.
> > >
> > > Generally speaking, everything works quite well - the virtual
> > network
> > > interfaces communicate with each other and, once I have setup my
> > root
> > > cell, which also has a physical network interface, to act as a
> > router
> > > for my non-root Linux, my non-root cell has access to the
> > external network.
> > >
> > > However, I noticed that sometimes the IP which I setup on the root
> > > cell's virtual interface gets "lost". That is  - I assign an IP with
> > > ifconfig to the virtual NIC and after a period of time (sometimes it
> > > takes > 1 minute) the IP is no longer there. I keep re-setting
> > the IP
> > > and eventually it "sticks"...
> > > At some point I thought it is setting the IP on the root's NIC after
> > > netif_carrier_on() is invoked for the root's NIC that makes the IP
> > > "stick", but it now looks like it is not the case and I no longer
> > have
> > > any clue as to what causes the IP "stick".
> >=20
> > Uhm, what distribution do you use for your root-cell?
> >=20
> > Unless the NIC state doesn't change over time (which could explain the
> > loss of the IP) it sounds to me like there is some Network
> > Configuration
> > Application that grabs the interface as soon as it exists and tries to
> > reconfigure it. Then it maybe tries to DHCP on the interface and the IP
> > is lost. Something like NetworkManager, systemd-networkd, =E2=80=A6 Is =
there
> > any
> > of those applications running in your root cell?
> >=20
> > Ralf
> >=20
> > >
> > > Has anyone seen anything similar?
> > > Any comments would be very much appreciated.
> > >
> > > Thank you
> > >
> > > Best Regards,
> > >
> > > Yelena
> > >
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-6=
92b8495f9ban%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>.
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
> https://groups.google.com/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9=
b04df0735c1n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9=
b04df0735c1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/71b6a090-1673-4371-bfde-da0445357825n%40googlegroups.com.

------=_Part_1649_707323196.1678984260693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,<br /><br />Thank you very much for trying to help and apologies fo=
r not replying earlier.<br /><br />Your guess about a network app trying to=
 reconfigure my VNIC was correct.<br />When I stopped using ifconfig for se=
tting an IP on my VNIC and used config. files in /etc/network/interfaces.d =
instead, the issue got resolved - I no longer "lose" the IP on the VNIC.<br=
 />It must have been the NetworkManager that tried to reconfigure the VNIC,=
 just as you have suggested.<br />Sorry for not making it clearer in my pre=
vious message.<br /><br />Best Regards,<br /><br />Yelena<br /><br /><div c=
lass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, Fe=
bruary 23, 2023 at 4:46:48=E2=80=AFPM UTC Ralf Ramsauer wrote:<br/></div><b=
lockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 23/02/2023 16:05, Yelena Konyukh wrote:
<br>&gt; Hi Ralf,
<br>&gt;=20
<br>&gt; Thank you very much for replying.
<br>&gt;=20
<br>&gt; Yes, my issue appears to be due to using &quot;ifconfig&quot;.
<br>&gt; The IP does not get lost since I have configured the virtual netwo=
rk=20
<br>&gt; interface via a file in /etc/network/interfaces.d as below:
<br>&gt; /etc/network/interfaces.d# cat enP1p0s1
<br>&gt; allow-hotplug enP1p0s1
<br>&gt; iface enP1p0s1 inet static
<br>&gt; address 192.168.0.1
<br>&gt; netmask 255.255.255.0
<br>
<br>Okay, and once the interface appears (i.e., when jailhouse is enabled),=
=20
<br>the IP is set, and after you while, you loose it. Do I get that right?
<br>
<br>Does dmesg give you any hints why the interface goes down? What about=
=20
<br>the interface in the non-root cell? Do you have the same issue there?
<br>
<br>Thanks
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Thank you agai.
<br>&gt;=20
<br>&gt; Best Regards,
<br>&gt;=20
<br>&gt; Yelena
<br>&gt;=20
<br>&gt; On Wednesday, February 22, 2023 at 3:27:10 PM UTC Ralf Ramsauer wr=
ote:
<br>&gt;=20
<br>&gt;     Hi Yelena,
<br>&gt;=20
<br>&gt;     On 21/02/2023 18:23, Yelena Konyukh wrote:
<br>&gt;      &gt;
<br>&gt;      &gt; Hi All,
<br>&gt;      &gt;
<br>&gt;      &gt; I would be very grateful for any comments on the followi=
ng issue:
<br>&gt;      &gt;
<br>&gt;      &gt; I run Jailhouse on an arm64 platform with Xilinx kernel.=
 I use
<br>&gt;      &gt; ivshmem-net driver and the relevant cells and .DTBs
<br>&gt;     configurations to
<br>&gt;      &gt; support a virtual network interface in my root cell and =
my non-root
<br>&gt;      &gt; Linux cell.
<br>&gt;      &gt;
<br>&gt;      &gt; Generally speaking, everything works quite well - the vi=
rtual
<br>&gt;     network
<br>&gt;      &gt; interfaces communicate with each other and, once I have =
setup my
<br>&gt;     root
<br>&gt;      &gt; cell, which also has a physical network interface, to ac=
t as a
<br>&gt;     router
<br>&gt;      &gt; for my non-root Linux, my non-root cell has access to th=
e
<br>&gt;     external network.
<br>&gt;      &gt;
<br>&gt;      &gt; However, I noticed that sometimes the IP which I setup o=
n the root
<br>&gt;      &gt; cell&#39;s virtual interface gets &quot;lost&quot;. That=
 is=C2=A0 - I assign an IP with
<br>&gt;      &gt; ifconfig to the virtual NIC and after a period of time (=
sometimes it
<br>&gt;      &gt; takes &gt; 1 minute) the IP is no longer there. I keep r=
e-setting
<br>&gt;     the IP
<br>&gt;      &gt; and eventually it &quot;sticks&quot;...
<br>&gt;      &gt; At some point I thought it is setting the IP on the root=
&#39;s NIC after
<br>&gt;      &gt; netif_carrier_on() is invoked for the root&#39;s NIC tha=
t makes the IP
<br>&gt;      &gt; &quot;stick&quot;, but it now looks like it is not the c=
ase and I no longer
<br>&gt;     have
<br>&gt;      &gt; any clue as to what causes the IP &quot;stick&quot;.
<br>&gt;=20
<br>&gt;     Uhm, what distribution do you use for your root-cell?
<br>&gt;=20
<br>&gt;     Unless the NIC state doesn&#39;t change over time (which could=
 explain the
<br>&gt;     loss of the IP) it sounds to me like there is some Network
<br>&gt;     Configuration
<br>&gt;     Application that grabs the interface as soon as it exists and =
tries to
<br>&gt;     reconfigure it. Then it maybe tries to DHCP on the interface a=
nd the IP
<br>&gt;     is lost. Something like NetworkManager, systemd-networkd, =E2=
=80=A6 Is there
<br>&gt;     any
<br>&gt;     of those applications running in your root cell?
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Has anyone seen anything similar?
<br>&gt;      &gt; Any comments would be very much appreciated.
<br>&gt;      &gt;
<br>&gt;      &gt; Thank you
<br>&gt;      &gt;
<br>&gt;      &gt; Best Regards,
<br>&gt;      &gt;
<br>&gt;      &gt; Yelena
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/e64=
7559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-9=
5bf-692b8495f9ban%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1679069=
700890000&amp;usg=3DAOvVaw0EzTfmiTmskPAbS_bv3qeG">https://groups.google.com=
/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/e64=
7559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-9=
5bf-692b8495f9ban%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1679069=
700890000&amp;usg=3DAOvVaw0EzTfmiTmskPAbS_bv3qeG">https://groups.google.com=
/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups=
.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google=
.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%2540google=
groups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;=
ust=3D1679069700890000&amp;usg=3DAOvVaw2nmE8hLVbNz0K-Ea0PrqDK">https://grou=
ps.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%4=
0googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a hre=
f=3D"https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95b=
f-692b8495f9ban%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfoot=
er" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-=
dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%2540googlegroups.com?utm_medium%3=
Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1679069700890000&=
amp;usg=3DAOvVaw2nmE8hLVbNz0K-Ea0PrqDK">https://groups.google.com/d/msgid/j=
ailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/c234432=
8-236a-4ec8-b713-9b04df0735c1n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-=
9b04df0735c1n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16790697008=
90000&amp;usg=3DAOvVaw3Qzv0V8bl9tlA7D-WdV3ci">https://groups.google.com/d/m=
sgid/jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/c234432=
8-236a-4ec8-b713-9b04df0735c1n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
679069700890000&amp;usg=3DAOvVaw3oZNHv7GVi9bot6diW8-RK">https://groups.goog=
le.com/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40google=
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
om/d/msgid/jailhouse-dev/71b6a090-1673-4371-bfde-da0445357825n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/71b6a090-1673-4371-bfde-da0445357825n%40googlegroups.co=
m</a>.<br />

------=_Part_1649_707323196.1678984260693--

------=_Part_1648_526037506.1678984260693--
