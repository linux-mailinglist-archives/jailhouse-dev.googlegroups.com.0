Return-Path: <jailhouse-dev+bncBCQLFK7J4IHBBKP43TWAKGQEDNUSFFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id B4530CBAB7
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 14:42:19 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id f26sf2700174otq.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L2gJS2hRYiD8gudmTmKNCXYIHAIIU3YI3dJoE4ZwBnA=;
        b=KBJelLX7vci7sa2p2uFFjAiaM/Fs8lR4vAyP39BxigoCpWTqe+DdjNyCCtO88bltUc
         lsuYxzqw4slz8khegLABmiT+ZSV9iKRey96hhPhEu8mi5tDUK4EAvkuoOQ2jUzRdGBL3
         aQL2/HGktHYsIp5T+4g0hUwXQhdBldCYoT4VlNu66zbQkg+qzmiIrwioe60fw8rK97F9
         9fx3BXi/S6Sqe94aDzXoWYiuuuaPGeUq7gq2VzI/9WR5qNtYjFKfEhjFlYnRD0VNwWLe
         N/DfaEvoUMk98kC3oAv97jxw6VVT7LUjj+0L8sL4LQ9BlnEp6Fr6g2vQ/hWtolT8MG5N
         u/4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L2gJS2hRYiD8gudmTmKNCXYIHAIIU3YI3dJoE4ZwBnA=;
        b=T5gba6XdUam9wZVPB58N0mt/vO/s9xrlHjfk9pX5kpOdHAtDTf+GfeK3urlMfBGM25
         eT7Ubx7oV6OYDpJKxDFxXbiQnKZEX1mx/1HFQARULMYRDWnyxw7v590F10BxI4drELAe
         rRjIuY3UgflPI6CLzYD7NBasBlI7r2uwqJiOB6EOsjDWIRilTxl02DogyPV+7TIb7mqq
         d8UPwl5cNg1e0VcrNrlsnVB/u5JsRXwaXqCWVBMpy4d7ghWa6mcXdEKuJcxxwK4qp+zl
         qEQWCHcrbKVROBW9ppbmWuy77OoU8scvztyJmWKWKIrMFTw2EDTtwmztoKKu4gXvUA1l
         n2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L2gJS2hRYiD8gudmTmKNCXYIHAIIU3YI3dJoE4ZwBnA=;
        b=e/hMzA9uwkwXPMqzZstw/jFTK8tdY4jr4Du06O6DFhIq2/g9c7bR+vz8X4PPh4lCQS
         zN1e03hHIZ8fcf+7NGVhlqbKv5RAA2bM0AgoSDVtjKGF3sKWiAoaOf5H4xJQGUgAc9XM
         jIAubkPDMdAj40yRun2q0NrDJw/TA0Dn5Yi40qRe9olJe/nVGO4rL6D3GAlugJco+akD
         OSG5/DzPwVv4Upj9h0EItmnueo3DzeN8DoKOD0WS07QZJV+pwq6G+zgAB/aj3/b/kzOt
         Z6ZCkPMJHGjDBgywHSRzoGLcF6/naG/EqphYAAURV0e8TgD8HeYrEgtgHjygWE3nPj0C
         hbVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVydXyqlQCaNmEjOywJmpkHorBztesFA9KYRzKTNBfNSr+Ij57H
	oci6w5ih6Llo2ErxiSUBuos=
X-Google-Smtp-Source: APXvYqyLHnM+BKYVaJ7axnlJOx0Zq8crrIxxFTGiS4EhTQd9+v4cXj/JHQkoQmcpVFPDFy5yNQGRbQ==
X-Received: by 2002:aca:4d85:: with SMTP id a127mr6641595oib.154.1570192938082;
        Fri, 04 Oct 2019 05:42:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:2049:: with SMTP id f9ls1068415otp.11.gmail; Fri,
 04 Oct 2019 05:42:17 -0700 (PDT)
X-Received: by 2002:a9d:68c6:: with SMTP id i6mr10811112oto.350.1570192937168;
        Fri, 04 Oct 2019 05:42:17 -0700 (PDT)
Date: Fri, 4 Oct 2019 05:42:16 -0700 (PDT)
From: andrew.nospam.elder@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <81512c03-363b-4a36-b351-47a22d02d734@googlegroups.com>
In-Reply-To: <AM0PR04MB448190961184192A4FCDA89D88850@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1520869955737.44500.12082@webmail1>
 <20180313041354.GA4567@shlinux2>
 <97387b16-18c1-f4c1-e0dd-3dce680fca51@ti.com>
 <AM0PR04MB44814CE0916D151BA9E6145188840@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <9c99b722-bc66-e6a5-6661-91d0c5ed001e@ti.com>
 <c2ba0030-ec7f-f3f4-2c29-b281404918e3@siemens.com>
 <AM0PR04MB448190961184192A4FCDA89D88850@AM0PR04MB4481.eurprd04.prod.outlook.com>
Subject: Re: Jailhouse on iMX8M
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_652_1457954011.1570192936467"
X-Original-Sender: andrew.nospam.elder@gmail.com
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

------=_Part_652_1457954011.1570192936467
Content-Type: multipart/alternative; 
	boundary="----=_Part_653_800072163.1570192936468"

------=_Part_653_800072163.1570192936468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peng,

Is there open source available somewhere that shows the changes to Linux=20
required to get Jailhouse running on an iMX8M?

Regards,
Andrew

On Thursday, January 10, 2019 at 8:35:15 PM UTC-5, Peng Fan wrote:
>
>
>
> > -----Original Message-----=20
> > From: Jan Kiszka [mailto:jan....@siemens.com <javascript:>]=20
> > Sent: 2019=E5=B9=B41=E6=9C=8811=E6=97=A5 9:30=20
> > To: Lokesh Vutla <lokes...@ti.com <javascript:>>; Peng Fan <
> pen...@nxp.com <javascript:>>; Peng=20
> > Fan <van.f...@gmail.com <javascript:>>=20
> > Cc: Jailhouse <jailho...@googlegroups.com <javascript:>>=20
> > Subject: Re: Jailhouse on iMX8M=20
> >=20
> > On 10.01.19 15:58, 'Lokesh Vutla' via Jailhouse wrote:=20
> > > On 10/01/19 11:08 AM, Peng Fan wrote:=20
> > >> Hi Lokesh=20
> > >>=20
> > >>> -----Original Message-----=20
> > >>> From: 'Lokesh Vutla' via Jailhouse=20
> > >>> [mailto:jailho...@googlegroups.com <javascript:>]=20
> > >>> Sent: 2019=E5=B9=B41=E6=9C=888=E6=97=A5 21:24=20
> > >>> To: Peng Fan <van.f...@gmail.com <javascript:>>=20
> > >>> Cc: jailho...@googlegroups.com <javascript:>=20
> > >>> Subject: Re: Jailhouse on iMX8M=20
> > >>>=20
> > >>> Hi Peng,=20
> > >>>         Sorry to bring up an old thread.=20
> > >>>=20
> > >>> On 13/03/18 9:43 AM, Peng Fan wrote:=20
> > >>>> Hi Anders,=20
> > >>>> On Mon, Mar 12, 2018 at 04:52:35PM +0100, Anders T??rnqvist wrote:=
=20
> > >>>>> I noticed that there are development ongoing for a iMX8M based=20
> > board.=20
> > >>> Great!=20
> > >>>>>=20
> > >>>>> When reading in the reference manual for iMX8M it does not have=
=20
> > >>> information about that the chip has virtualization extensions.=20
> > >>>>> The web information about another chip - iMX8 - clearly talks=20
> > >>>>> about=20
> > >>> virtualization extentions.=20
> > >>>>>=20
> > >>>>> The existing Jailhouse development for the iMX8M must be a proof=
=20
> > >>>>> of=20
> > >>> some support for virtualization.=20
> > >>>>> Right?=20
> > >>>>=20
> > >>>> The i.MX8M supports ARM virtualization extension.=20
> > >>>=20
> > >>> I am bit exited to see a doc[1] saying that iMX8Qm doesn't need a S=
W=20
> > >>> hypervisor for running two OSs on the same SoC. Out of curiosity,=
=20
> > >>> was wondering how does the IRQ routing happens without hypervisor?=
=20
> > >>> Also I am interested to see more details on this problem. Are there=
=20
> > >>> any public docs that I take a look?=20
> > >>=20
> > >> It is i.MX8QM, not i.MX8M :)=20
> > >>=20
> > >> It was developed by other team, I do not have much info.=20
> > >> There is only one GIC controller, so need to config GIC distribute t=
o=20
> > >> make sure SPI are routed to cores correctly, and linux gic code also=
=20
> needs=20
> > to be modified.=20
> > >=20
> > > If linux driver is used for configuring gic, then one VM can=20
> > > potentially screw other VM interrupts no? But anyways it is=20
> > > interesting to see how all the these problems are solved without=20
> > > hypervisor :)=20
> >=20
> > I suppose it boils down to the questions who is in charge of configurin=
g=20
> the=20
> > shared resources and who can control the access to it - or it is just=
=20
> standard=20
> > collaborative AMP, something everyone did before the arrival of=20
> virtualization.=20
>
> To run without hypervisor, first need to disable coherency between the=20
> OSes,=20
> on i.MX8QM, it is cluster coherency disabled.=20
> The major issue is GIC. About gic, OS only need to touch gic cpu interfac=
e=20
> which=20
> is per cpu, no need touch gic distributor. Anyway this has no chance to b=
e=20
> accepted by Linux Kernel.=20
>
> Regards,=20
> Peng.=20
>
> >=20
> > Jan=20
> >=20
> > --=20
> > --=20
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate=20
> > Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/81512c03-363b-4a36-b351-47a22d02d734%40googlegroups.com.

------=_Part_653_800072163.1570192936468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Peng,<div><br></div><div>Is there open source available so=
mewhere that shows the changes to Linux required to get Jailhouse running o=
n an iMX8M?</div><div><br></div><div>Regards,</div><div>Andrew<br><br>On Th=
ursday, January 10, 2019 at 8:35:15 PM UTC-5, Peng Fan wrote:<blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px =
#ccc solid;padding-left: 1ex;">
<br>
<br>&gt; -----Original Message-----
<br>&gt; From: Jan Kiszka [mailto:<a href=3D"javascript:" target=3D"_blank"=
 gdf-obfuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;ja=
vascript:&#39;;return true;">jan....@siemens.com</a><wbr>]
<br>&gt; Sent: 2019=E5=B9=B41=E6=9C=8811=E6=97=A5 9:30
<br>&gt; To: Lokesh Vutla &lt;<a href=3D"javascript:" target=3D"_blank" gdf=
-obfuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javasc=
ript:&#39;;return true;">lokes...@ti.com</a>&gt;; Peng Fan &lt;<a href=3D"j=
avascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D=
"nofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" o=
nclick=3D"this.href=3D&#39;javascript:&#39;;return true;">pen...@nxp.com</a=
>&gt;; Peng
<br>&gt; Fan &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-m=
ailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;jav=
ascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;re=
turn true;">van.f...@gmail.com</a>&gt;
<br>&gt; Cc: Jailhouse &lt;<a href=3D"javascript:" target=3D"_blank" gdf-ob=
fuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;">jailho...@googlegroups.<wbr>com</a>&gt;
<br>&gt; Subject: Re: Jailhouse on iMX8M
<br>&gt;=20
<br>&gt; On 10.01.19 15:58, &#39;Lokesh Vutla&#39; via Jailhouse wrote:
<br>&gt; &gt; On 10/01/19 11:08 AM, Peng Fan wrote:
<br>&gt; &gt;&gt; Hi Lokesh
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt;&gt; -----Original Message-----
<br>&gt; &gt;&gt;&gt; From: &#39;Lokesh Vutla&#39; via Jailhouse
<br>&gt; &gt;&gt;&gt; [mailto:<a href=3D"javascript:" target=3D"_blank" gdf=
-obfuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javasc=
ript:&#39;;return true;">jailho...@<wbr>googlegroups.com</a>]
<br>&gt; &gt;&gt;&gt; Sent: 2019=E5=B9=B41=E6=9C=888=E6=97=A5 21:24
<br>&gt; &gt;&gt;&gt; To: Peng Fan &lt;<a href=3D"javascript:" target=3D"_b=
lank" gdf-obfuscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">van.f...@gmail.com</a>&gt;
<br>&gt; &gt;&gt;&gt; Cc: <a href=3D"javascript:" target=3D"_blank" gdf-obf=
uscated-mailto=3D"N4QpLDDRDwAJ" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;">jailho...@googlegroups.com</a>
<br>&gt; &gt;&gt;&gt; Subject: Re: Jailhouse on iMX8M
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; Hi Peng,
<br>&gt; &gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Sorry=
 to bring up an old thread.
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; On 13/03/18 9:43 AM, Peng Fan wrote:
<br>&gt; &gt;&gt;&gt;&gt; Hi Anders,
<br>&gt; &gt;&gt;&gt;&gt; On Mon, Mar 12, 2018 at 04:52:35PM +0100, Anders =
T??rnqvist wrote:
<br>&gt; &gt;&gt;&gt;&gt;&gt; I noticed that there are development ongoing =
for a iMX8M based
<br>&gt; board.
<br>&gt; &gt;&gt;&gt; Great!
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; When reading in the reference manual for iMX8=
M it does not have
<br>&gt; &gt;&gt;&gt; information about that the chip has virtualization ex=
tensions.
<br>&gt; &gt;&gt;&gt;&gt;&gt; The web information about another chip - iMX8=
 - clearly talks
<br>&gt; &gt;&gt;&gt;&gt;&gt; about
<br>&gt; &gt;&gt;&gt; virtualization extentions.
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; The existing Jailhouse development for the iM=
X8M must be a proof
<br>&gt; &gt;&gt;&gt;&gt;&gt; of
<br>&gt; &gt;&gt;&gt; some support for virtualization.
<br>&gt; &gt;&gt;&gt;&gt;&gt; Right?
<br>&gt; &gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt; The i.MX8M supports ARM virtualization extension.
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; I am bit exited to see a doc[1] saying that iMX8Qm do=
esn&#39;t need a SW
<br>&gt; &gt;&gt;&gt; hypervisor for running two OSs on the same SoC. Out o=
f curiosity,
<br>&gt; &gt;&gt;&gt; was wondering how does the IRQ routing happens withou=
t hypervisor?
<br>&gt; &gt;&gt;&gt; Also I am interested to see more details on this prob=
lem. Are there
<br>&gt; &gt;&gt;&gt; any public docs that I take a look?
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; It is i.MX8QM, not i.MX8M :)
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; It was developed by other team, I do not have much info.
<br>&gt; &gt;&gt; There is only one GIC controller, so need to config GIC d=
istribute to
<br>&gt; &gt;&gt; make sure SPI are routed to cores correctly, and linux gi=
c code also needs
<br>&gt; to be modified.
<br>&gt; &gt;
<br>&gt; &gt; If linux driver is used for configuring gic, then one VM can
<br>&gt; &gt; potentially screw other VM interrupts no? But anyways it is
<br>&gt; &gt; interesting to see how all the these problems are solved with=
out
<br>&gt; &gt; hypervisor :)
<br>&gt;=20
<br>&gt; I suppose it boils down to the questions who is in charge of confi=
guring the
<br>&gt; shared resources and who can control the access to it - or it is j=
ust standard
<br>&gt; collaborative AMP, something everyone did before the arrival of vi=
rtualization.
<br>
<br>To run without hypervisor, first need to disable coherency between the =
OSes,
<br>on i.MX8QM, it is cluster coherency disabled.
<br>The major issue is GIC. About gic, OS only need to touch gic cpu interf=
ace which
<br>is per cpu, no need touch gic distributor. Anyway this has no chance to=
 be accepted by Linux Kernel.
<br>
<br>Regards,
<br>Peng.
<br>
<br>&gt;=20
<br>&gt; Jan
<br>&gt;=20
<br>&gt; --
<br>&gt; --
<br>&gt; Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
<br>&gt; Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/81512c03-363b-4a36-b351-47a22d02d734%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/81512c03-363b-4a36-b351-47a22d02d734%40googlegroups.com<=
/a>.<br />

------=_Part_653_800072163.1570192936468--

------=_Part_652_1457954011.1570192936467--
