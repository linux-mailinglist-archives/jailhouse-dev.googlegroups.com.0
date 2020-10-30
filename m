Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBB2MK536AKGQEV2BAPPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3F29FC15
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 04:15:55 +0100 (CET)
Received: by mail-qv1-xf3b.google.com with SMTP id ec4sf2941827qvb.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rcESm3djuxH7N9V3QALQ/Sh7XKfUFrWmwQ5nP0D7vYs=;
        b=c00HjsCaxnZDKLMHHfb+GOGRPO6pI24bdB+hLqkkm2C5BryraWbKh2/OioENkRc6fX
         loGqPGVmj2vPGDunIcabpvnF+cFbGzX7Vs4EwRMSOP3fp//nJqWsuVqRK9aWlqfSwah0
         q5iiJsck7quSuJNreD0TW/8eidYz1d/0wt99Wi7Hp+C5ZYRwsWjrABXXqE7lUvuS/uR2
         GYgpuIH3zgkiVtMLJJ3p+fw8Ljpc2TJsJfnxYqpBaaR21msEPsfVj+WAS7VQZLMgx+IN
         WtXCXM5KneSym0Y0ego4MsdkK6U72F/kJ05Gtk/6i7cAw5pLo1twzcrMY30a9UV9My5S
         OVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rcESm3djuxH7N9V3QALQ/Sh7XKfUFrWmwQ5nP0D7vYs=;
        b=V70vs5iZsHHPBDcWu4LBQ2PQIM42I1eSUofowcl5G6SPswG42FEhCbOy8Eq/jh6XE7
         /0hKt3eVC2VuZM/APGvMsxzqgLdU4zA7GIGmvCHOjHBRjRsz3cTxVp3L9pXSRczhtc3P
         2iUKNqTJZzpDAUDB2PdsmXdiSdPI8ACaojV7LxQrzXjphtM2JnIdRA6H3N91AQNrXfBb
         hRwEWudmppkcUD+0fOIxeSyIMybFNgqnUXAqpqkGN0XBtc0XmPO7IFn7t9Y0eA0Utplz
         fVJSl56qzbjET94ukVSuRoGP0+DG8K4AIetO8f1j7v87q+WFvkBQIjdbm1VDxW/GdLK7
         v84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rcESm3djuxH7N9V3QALQ/Sh7XKfUFrWmwQ5nP0D7vYs=;
        b=CffdkvgGz0i53yJBiUMA2J1xdRWDRb/4WVaF+T/+jpoL8m9aFMYc+1PYjRDqdkiqEk
         J4V/IadFZf1DHUje66zwOWENgFOC3bGxDwlJywNA2nnQ/IbI/p4dYUKxAFg8bffGEzAW
         0/vo5MDS3/Ljkbg/AI5dKOOa4n6aE6rAf1Tk/sQQlWVn4qjXOMw82MvFbR8V1Z3KOkiK
         7RK3JglcySS/wouhQsLhK7IDsKXnAQiidGcYJulq/oT/fRIMEVPDru6RBYPMyvW7zpMj
         EoWCkAT8Ykq7xSRGwUTg3kxHnp0zJLp16Ck7YZ3mngQ67JUQrK8aFT8bURdYAlbS3pOm
         +xHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530INNnNnGqFAAoJZE3Fe0VrIgMr1uQ/U72jV7quYYmQ22GxSP9Y
	RuRnGu0MAg0sGSpqLPlZzDc=
X-Google-Smtp-Source: ABdhPJzMzmU5Ot0wpDkyXYZWC/cPlh9sBOy2GENaM47QqulqTn3FGRhv8cXkap2ccwnpGZ6iS+lllQ==
X-Received: by 2002:a37:8846:: with SMTP id k67mr119151qkd.132.1604027753773;
        Thu, 29 Oct 2020 20:15:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1248:: with SMTP id a8ls2416821qkl.11.gmail; Thu,
 29 Oct 2020 20:15:53 -0700 (PDT)
X-Received: by 2002:a37:4387:: with SMTP id q129mr361098qka.82.1604027753032;
        Thu, 29 Oct 2020 20:15:53 -0700 (PDT)
Date: Thu, 29 Oct 2020 20:15:52 -0700 (PDT)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <28196abf-ab56-424d-9a27-9cc58f21f4dcn@googlegroups.com>
In-Reply-To: <8bb875bd-4f30-4dd9-707a-6bd2e54d0575@siemens.com>
References: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
 <bf532fea-eca9-1c8b-a814-682e34962332@siemens.com>
 <d66e8b2f-e499-40d2-8257-4d93597bfff9n@googlegroups.com>
 <8bb875bd-4f30-4dd9-707a-6bd2e54d0575@siemens.com>
Subject: Re: Jailhouse hang on NXP ls1046a ARM64 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_694_361244167.1604027752023"
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

------=_Part_694_361244167.1604027752023
Content-Type: multipart/alternative; 
	boundary="----=_Part_695_606246263.1604027752023"

------=_Part_695_606246263.1604027752023
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan

=E5=9C=A82020=E5=B9=B410=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 =E4=B8=8B=E5=8D=886:38:08<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 29.10.20 10:12, Peter pan wrote:=20
> > Thanks Jan for your help. Now I have fixe the issue, the issue is from =
I=20
> > mapped the whole DCSR space together, after removing it and adding some=
=20
> > memeroy region of IPs,  now I run jailhouse enable without any errors.=
=20
>
> Perfect.=20
>
> >=20
> > One more questions, do we need to map memory regions of all the IPs in=
=20
> > SYSCONFIG?  or only IPs to be used in cells? thanks again.=20
> >=20
>
> Only used one. You may even leave out IP from the root cell that was=20
> only configured during boot-up and will not longer be touched under=20
> normal conditions during runtime ("freeze" the IP, e.g. to prevent=20
> malicious misconfiguration).=20
>
> BTW, do you plan to activate the SMMU as well? We are current stressing=
=20
> the new implementation by your colleagues on the i.MX8 and the ZynqMP=20
> and could use more testers on other silicon.=20
>
> Yes, I indeed have plan to enable SMMU, please let me know what and how I=
=20
can do, thanks.\

Perer P.
=20

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
jailhouse-dev/28196abf-ab56-424d-9a27-9cc58f21f4dcn%40googlegroups.com.

------=_Part_695_606246263.1604027752023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_=
attr">=E5=9C=A82020=E5=B9=B410=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=
=9B UTC+8 =E4=B8=8B=E5=8D=886:38:08&lt;j.kiszka...@gmail.com&gt; =E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">On 29.10.20 10:12, Peter pan wrote:
<br>&gt; Thanks Jan for your help. Now I have fixe the issue, the issue is =
from I
<br>&gt; mapped the whole DCSR space together, after removing it and adding=
 some
<br>&gt; memeroy region of IPs,&nbsp; now I run jailhouse enable without an=
y errors.=20
<br>
<br>Perfect.
<br>
<br>&gt;=20
<br>&gt; One more questions, do we need to map memory regions of all the IP=
s in
<br>&gt; SYSCONFIG?&nbsp; or only IPs to be used in cells? thanks again.
<br>&gt;=20
<br>
<br>Only used one. You may even leave out IP from the root cell that was
<br>only configured during boot-up and will not longer be touched under
<br>normal conditions during runtime ("freeze" the IP, e.g. to prevent
<br>malicious misconfiguration).
<br>
<br>BTW, do you plan to activate the SMMU as well? We are current stressing
<br>the new implementation by your colleagues on the i.MX8 and the ZynqMP
<br>and could use more testers on other silicon.
<br>
<br></blockquote><div>Yes, I indeed have plan to enable SMMU, please let me=
 know what and how I can do, thanks.\</div><div><br></div><div>Perer P.</di=
v><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0=
 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Jan
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
om/d/msgid/jailhouse-dev/28196abf-ab56-424d-9a27-9cc58f21f4dcn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/28196abf-ab56-424d-9a27-9cc58f21f4dcn%40googlegroups.co=
m</a>.<br />

------=_Part_695_606246263.1604027752023--

------=_Part_694_361244167.1604027752023--
