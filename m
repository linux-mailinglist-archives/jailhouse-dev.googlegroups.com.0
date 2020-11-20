Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBB2HU3T6QKGQE5C675BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 324102BA144
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Nov 2020 04:39:22 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id f9sf6790755qkg.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 19:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/B7L8AOJKbeS/ayFOPQ/vllJEp630bZ6d6gC5JfVDls=;
        b=dZUvR7SUnToew1kf181qsG9O19uQZkjV3Et666pMMFqN67HKZwE9h7tUU/ukI2c6j/
         aOhoVJ/wBBiMqGXa8eM5nAswCl8Z6ncPpZRyec6IsXTXJqbnBf+Lmy7IBt7reB8a/p+K
         5S6GrV1HrfYzADJyrhhGJy25C+1jbbzzpnycRJCI42PyTFvlFm1dtowJcSz1/HpPA6pi
         P7SBbStd4gNWk+v0HH9dwrDQpbkm7dw73cLw6f3ZSRG+jFQddWEbBCUF0QjQN5hr6Zfw
         8x4x+3tioOItsyP4z0u18SlmQS14RQxBSTkOKp62IsX0uFemWPHUNkgFxo85b7BJkP9y
         yCdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/B7L8AOJKbeS/ayFOPQ/vllJEp630bZ6d6gC5JfVDls=;
        b=m6FYhJVNKA/HFiZn6I5YbQ4NxAfPWVMhOjhzI1V2lMelXncPRQT8uRfBGlZnTBw/YI
         gcTSwIKZWrrWWO8N5mUrEv5l2SpPNv3dnVxD+nBAvONnz3mwALDysBv782uYXA9ckOJX
         qwKCmRxDboX+ZKsGdhOCFOvPRDysMnQvhYkl7F/sle83Qm+QnqEb3csxcbgPCDowa/uf
         KVVJEQ3OozIJ6iwYcuxnhemLBk4ywyUe/IS7MDtQmKsd2GjaGPAzvNzciHsCYl2FZ4VF
         Rx3BHyz2lYMZbpyhQeGmP+HSo0YVNQkscvW3jxWHhnhiQ+8gCRhZzY0aws6r995bH00i
         xGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/B7L8AOJKbeS/ayFOPQ/vllJEp630bZ6d6gC5JfVDls=;
        b=NkrmHK6cFtmWeGMPKhV74th85Me7Kdhi2PKseCnLU1axTRWgdbT5dZ8szwtsZm2tqi
         Map/D12Jf6zjnrDVENbZgdhNJiLpvmXce16LXUrVprQJy+t366OaVhMmswgA/dAHBYez
         K7IeK3sg7uNgmvtMowrIrs2rfeos4Oq3wXD77LhRFJl9GQLTVAvAj/fVwJ1fnwJCRBub
         Toy3Y0yuhqTlGFRv6m3RL4f74R0bckF38ChCHOpeICUxWA/dd5o7HlpkZ6XjAeTbqGA6
         5sxcoX119SgccpLGOGq08rNrN3m9g4tP3HlLU0GLEZfSuLE5iXYMw8R4cWRDL8RRq3cY
         jSgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335XKw4UTTGtERr3KdCUm/oVUy/8X9gKshyjGd/JJw6qRo8hymT
	samPADvuEUuTyZD9KKEZFjY=
X-Google-Smtp-Source: ABdhPJxGDNeBxYe2ozir8sl4cMgHao62aUWaqjFoU6/DBTF0UYQ+IdHs+BlKGTMSUvvi0Tj9Ly4lUw==
X-Received: by 2002:a37:6412:: with SMTP id y18mr14474303qkb.84.1605843560816;
        Thu, 19 Nov 2020 19:39:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a3cd:: with SMTP id m196ls2341494qke.9.gmail; Thu, 19
 Nov 2020 19:39:20 -0800 (PST)
X-Received: by 2002:a37:793:: with SMTP id 141mr14183191qkh.462.1605843560171;
        Thu, 19 Nov 2020 19:39:20 -0800 (PST)
Date: Thu, 19 Nov 2020 19:39:19 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <525f34ef-be0c-451d-b626-43763045008cn@googlegroups.com>
In-Reply-To: <803d46bb-b51a-6fba-7bfc-3e6d2145a8cd@siemens.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
 <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
 <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
 <9ea3bc46-677d-7e23-0bff-70d0218898da@siemens.com>
 <581e32ac-d032-4108-b4fe-21286e6b2085n@googlegroups.com>
 <803d46bb-b51a-6fba-7bfc-3e6d2145a8cd@siemens.com>
Subject: Re: one question about MSI-X support for vPCI
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1246_1011041752.1605843559387"
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

------=_Part_1246_1011041752.1605843559387
Content-Type: multipart/alternative; 
	boundary="----=_Part_1247_931475923.1605843559387"

------=_Part_1247_931475923.1605843559387
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,

The following is my debug log:

On root cell, enable root cell:
[  267.783070] uio_ivshmem 0003:00:00.0: output_section at=20
0x00000000fb70a000, size 0x0000000000002000
[  267.792364] ivshmem-net 0003:00:01.0: enabling device (0000 -> 0002)
[  267.798798] ivshmem-net 0003:00:01.0: TX memory at 0x00000000fb801000,=
=20
size 0x000000000007f000
[  267.807443] ivshmem-net 0003:00:01.0: RX memory at 0x00000000fb880000,=
=20
size 0x000000000007f000
[  267.816408] ********ivshm_net_state_change:state=3D0,peer_state=3D0  // =
Then=20
root cell NIC state is changed to be INIT, inmate NIC is RESET
[  267.816471] The Jailhouse is opening.

Then execute linux inmate cell loading:
[  673.503776] ********ivshm_net_state_change:state=3D1,peer_state=3D1  // =
Then=20
root cell NIC state is changed to be READY, inmate NIC is INIT
[  673.510338] ********ivshm_net_state_change:state=3D2,peer_state=3D2  // =
Then=20
root cell NIC state is changed to be READY, inmate NIC is READY, and then=
=20
set carrior on
[  673.516315] *****set carrier on

For inmate Cell, during kernel boot up and driver probe:

[    1.649054] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
[    1.655516] ivshmem-net 0000:00:01.0: TX memory at 0x00000000fb880000,=
=20
size 0x000000000007f000
[    1.664142] ivshmem-net 0000:00:01.0: RX memory at 0x00000000fb801000,=
=20
size 0x000000000007f000
[    1.673180] ********ivshm_net_state_change:state=3D0,peer_state=3D1 // T=
hen=20
inmate cell NIC state is changed to be INIT, root cell NIC is INIT
[    1.673579] uio_ivshmem 0000:00:00.0: enabling device (0000 -> 0002)
[    1.685477] ********ivshm_net_state_change:state=3D1,peer_state=3D2 // T=
hen=20
inmate cell NIC state is changed to be READY, root cell NIC is READY, but=
=20
after that and before ifconfig NIC up, ivshm_net_state_change is not called=
=20
anymore, so carrior is not set to be on.


We can find that before ifconfig up (open) virtual NIC, although stats both=
=20
for NIC in root cell and inmate cell are all READY, but carrior in root=20
cell is on, but in inmate cell if off.
So I don't think virtual NIC in root cell and inmate cell is whole symmetri=
c

Thanks.
Jiafei.

=E5=9C=A82020=E5=B9=B411=E6=9C=8819=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 =E4=B8=8B=E5=8D=884:28:48<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 19.11.20 08:52, Peter pan wrote:=20
> > Hi, Jan,=20
> >=20
> > After some investigation, I found the root cause of the issue: the=20
> > carrier is not=20
> > changed to be on if we open virtual NIC in inmate firstly, attached=20
> > patch can=20
> > fix this issue, please help to review, by the way where I can upstream=
=20
> > this patch?=20
>
> Thanks for the patch!=20
>
> I'm just wondering, given that ivshmem-net is conceptually fully=20
> symmetric, what is causing this issue to only happen in one way. Guess I=
=20
> need to study the scenario in details.=20
>
> Jan=20
>
> > Thanks.=20
> >=20
> > Best Regards,=20
> > Jiafei.=20
> >=20
> > =E5=9C=A82020=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=
 UTC+8 =E4=B8=8B=E5=8D=886:01:51<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=
=EF=BC=9A=20
> >=20
> > On 18.11.20 10:50, Peter pan wrote:=20
> > > Hi, Jan,=20
> > >=20
> > > I have one new issue and not sure it is a know issue.=20
> > >=20
> > > The issue is: when I ifconfig up ivshmem-net NIC in root cell firstly=
=20
> > > and then ifconfig up ivshmem NIC in inmate cell (runing Linux),  I=20
> > can=20
> > > ping through between two NICs, but if I ifconfig up NIC in inmate=20
> > cell=20
> > > before ifconfig up the NIC in root cell, I can't ping through between=
=20
> > > two NICs, and I found NIC in inmate can only receive packet=20
> > sending from=20
> > > root cell NIC, but NIC in root cell can't receive any packet and=20
> > there=20
> > > is also no irq received for ivshmem NIC.=20
> > >=20
> >=20
> > The link states of both virtual NICs are up (ethtool)? Is there any=20
> > ivshmem-net interrupt received at all on the root side? There should be=
=20
> > a few during setup at least.=20
> >=20
> > Check that the interrupt line on the root side is really free, and also=
=20
> > that GICD is properly intercepted by Jailhouse (check mappings).=20
> >=20
> > Jan=20
> >=20
> > --=20
> > Siemens AG, T RDA IOT=20
> > Corporate Competence Center Embedded Linux=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-2=
1286e6b2085n%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-2=
1286e6b2085n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
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
jailhouse-dev/525f34ef-be0c-451d-b626-43763045008cn%40googlegroups.com.

------=_Part_1247_931475923.1605843559387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,<div><br></div><div>The following is my debug log:</div><div><br></=
div><div>On <font color=3D"#ff0000">root cell</font>, enable root cell:</di=
v><div><div>[&nbsp; 267.783070] uio_ivshmem 0003:00:00.0: output_section at=
 0x00000000fb70a000, size 0x0000000000002000</div><div>[&nbsp; 267.792364] =
ivshmem-net 0003:00:01.0: enabling device (0000 -&gt; 0002)</div><div>[&nbs=
p; 267.798798] ivshmem-net 0003:00:01.0: TX memory at 0x00000000fb801000, s=
ize 0x000000000007f000</div><div>[&nbsp; 267.807443] ivshmem-net 0003:00:01=
.0: RX memory at 0x00000000fb880000, size 0x000000000007f000</div><div>[&nb=
sp; 267.816408] ********ivshm_net_state_change:state=3D0,peer_state=3D0&nbs=
p; /<font color=3D"#ff0000">/ Then root cell NIC state is changed to be INI=
T, inmate NIC is RESET</font></div><div>[&nbsp; 267.816471] The Jailhouse i=
s opening.</div><div><br></div><div>Then execute linux inmate cell loading:=
</div><div><div>[&nbsp; 673.503776] ********ivshm_net_state_change:state=3D=
1,peer_state=3D1&nbsp; /<font color=3D"#ff0000">/ Then root cell NIC state =
is changed to be READY, inmate NIC is INIT</font></div><div>[&nbsp; 673.510=
338] ********ivshm_net_state_change:state=3D2,peer_state=3D2&nbsp; /<font c=
olor=3D"#ff0000">/ Then root cell NIC state is changed to be READY, inmate =
NIC is READY, and then set carrior on</font></div><div>[&nbsp; 673.516315] =
*****set carrier on</div></div><div><br></div><div>For <font color=3D"#ff00=
00">inmate Cell</font>, during kernel boot up and driver probe:</div><div><=
br></div><div><div>[&nbsp; &nbsp; 1.649054] ivshmem-net 0000:00:01.0: enabl=
ing device (0000 -&gt; 0002)<br></div><div>[&nbsp; &nbsp; 1.655516] ivshmem=
-net 0000:00:01.0: TX memory at 0x00000000fb880000, size 0x000000000007f000=
</div><div>[&nbsp; &nbsp; 1.664142] ivshmem-net 0000:00:01.0: RX memory at =
0x00000000fb801000, size 0x000000000007f000</div><div>[&nbsp; &nbsp; 1.6731=
80] ********ivshm_net_state_change:state=3D0,peer_state=3D1 <font color=3D"=
#ff0000">// Then inmate cell NIC state is changed to be INIT, root cell NIC=
 is INIT</font></div><div>[&nbsp; &nbsp; 1.673579] uio_ivshmem 0000:00:00.0=
: enabling device (0000 -&gt; 0002)</div><div>[&nbsp; &nbsp; 1.685477] ****=
****ivshm_net_state_change:state=3D1,peer_state=3D2 <font color=3D"#ff0000"=
>// Then inmate cell NIC state is changed to be READY, root cell NIC is REA=
DY, but after that and before ifconfig NIC up, ivshm_net_state_change is no=
t called anymore, so carrior is not set to be on.</font></div></div><div><b=
r></div><br></div><div>We can find that before ifconfig up (open) virtual N=
IC, although stats both for NIC in root cell and inmate cell are all READY,=
 but carrior in root cell is on, but in inmate cell if off.</div><div>So I =
don't think virtual NIC in root cell and inmate cell is whole symmetric</di=
v><div><br></div><div>Thanks.</div><div>Jiafei.</div><div><br></div><div cl=
ass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=
=B9=B411=E6=9C=8819=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 =E4=B8=8B=E5=
=8D=884:28:48&lt;j.kiszka...@gmail.com&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border=
-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 19.11.20 08:52,=
 Peter pan wrote:
<br>&gt; Hi, Jan,
<br>&gt;=20
<br>&gt; After some investigation, I found the root cause of the issue: the
<br>&gt; carrier is not
<br>&gt; changed to be on if we open virtual NIC in inmate firstly, attache=
d
<br>&gt; patch can
<br>&gt; fix this issue, please help to review, by the way where I can upst=
ream
<br>&gt; this patch?
<br>
<br>Thanks for the patch!
<br>
<br>I'm just wondering, given that ivshmem-net is conceptually fully
<br>symmetric, what is causing this issue to only happen in one way. Guess =
I
<br>need to study the scenario in details.
<br>
<br>Jan
<br>
<br>&gt; Thanks.
<br>&gt;=20
<br>&gt; Best Regards,
<br>&gt; Jiafei.
<br>&gt;=20
<br>&gt; =E5=9C=A82020=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=89 UTC+8 =E4=B8=8B=E5=8D=886:01:51&lt;<a href=3D"" data-email-masked=3D=
"" rel=3D"nofollow">j.kiszka...@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=
=9A
<br>&gt;=20
<br>&gt;     On 18.11.20 10:50, Peter pan wrote:
<br>&gt;     &gt; Hi, Jan,
<br>&gt;     &gt;
<br>&gt;     &gt; I have one new issue and not sure it is a know issue.
<br>&gt;     &gt;
<br>&gt;     &gt; The issue is: when I ifconfig up ivshmem-net NIC in root =
cell firstly
<br>&gt;     &gt; and then ifconfig up ivshmem NIC in inmate cell (runing L=
inux),&nbsp; I
<br>&gt;     can
<br>&gt;     &gt; ping through between two NICs, but if I ifconfig up NIC i=
n inmate
<br>&gt;     cell
<br>&gt;     &gt; before ifconfig up the NIC in root cell, I can't ping thr=
ough between
<br>&gt;     &gt; two NICs, and I found NIC in inmate can only receive pack=
et
<br>&gt;     sending from
<br>&gt;     &gt; root cell NIC, but NIC in root cell can't receive any pac=
ket and
<br>&gt;     there
<br>&gt;     &gt; is also no irq received for ivshmem NIC.
<br>&gt;     &gt;
<br>&gt;=20
<br>&gt;     The link states of both virtual NICs are up (ethtool)? Is ther=
e any
<br>&gt;     ivshmem-net interrupt received at all on the root side? There =
should be
<br>&gt;     a few during setup at least.
<br>&gt;=20
<br>&gt;     Check that the interrupt line on the root side is really free,=
 and also
<br>&gt;     that GICD is properly intercepted by Jailhouse (check mappings=
).
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, T RDA IOT
<br>&gt;     Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups "Jailhouse" group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href=3D"" data-email-masked=3D"" rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"" data-email-masked=3D"" rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/581e32a=
c-d032-4108-b4fe-21286e6b2085n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4=
fe-21286e6b2085n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16059275=
19483000&amp;usg=3DAFQjCNGYYRGvvL_G7CHS54zP1l6Ts4G-sw">https://groups.googl=
e.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b2085n%40googleg=
roups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/581=
e32ac-d032-4108-b4fe-21286e6b2085n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.=
com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b2085n%2540googleg=
roups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;u=
st=3D1605927519483000&amp;usg=3DAFQjCNGBYps2FQ_PLA2DE1L8LKbo6A55dQ">https:/=
/groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-21286e6b20=
85n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/525f34ef-be0c-451d-b626-43763045008cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/525f34ef-be0c-451d-b626-43763045008cn%40googlegroups.co=
m</a>.<br />

------=_Part_1247_931475923.1605843559387--

------=_Part_1246_1011041752.1605843559387--
