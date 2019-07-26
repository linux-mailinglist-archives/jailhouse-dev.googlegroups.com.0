Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBX7T5TUQKGQEC6QK4RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E877057
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:35:28 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id p7sf29413871otk.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ROjQzA+jaUJ6RDFw5s0vhKbojLmIUlPAj/k/QKIDWqQ=;
        b=J2wZcRXsRfBCZJi8whiNvvV5buay4Lf2yrVo7vKbLQ0mEaTrPQ3S6ho2WHt9nkAn3v
         LF+5H+X4KFnUnLCXTudrdax+yNvvn6QyYQF3JrLM5AwhCqOOIQK7FiC+dDSFZmOhlmHc
         KG9cb4nswhWD6ztUMTzSgy2fyWizJP/BILTNK9aywpkVyVSV4hCtH3er4P5uk5xUb2oL
         NG20lgcbwWwf87/3fU92HRLO2trRhGmAXV5rYQsA5TiwuY4m1q/z8qKuK3PshObhsGd3
         vJvRW/PJjKGrmor9S2XaZ6ooZn4twlW6ibe280066d2i0LMYqtqYLoGFQBd4uYLipW1C
         6d3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ROjQzA+jaUJ6RDFw5s0vhKbojLmIUlPAj/k/QKIDWqQ=;
        b=mkp+PhlVgJ8rX6UwpShKuEg2ijsJxZnyyuYij4nOsLW0c7IPyMk4mwyWUshDAnHalA
         9uSVz9DRq7e8p2+8qfluJ9VRjEylGyOXPCPMN0Ca7ErQEjsT2yAdnMyTtRbB/tlxorIU
         PvpUCLfzBu7hfiidr1ousM1+5R+70h4uWmgvA2XoNtAOwL1A2b6kcZ/43Sq00nRKY6Xi
         3a7UZbgSC8+58BG1tkdE6WcOxEFwl5XirAcHUXxJ2Fw87ff1tmpU1HdyYspbGa6jNYY3
         skukKL9z9SJjjd8OfKgpyocsSNX4VaxXCzbIrO9/FSnqZxvrg4NGnEu6aCB09YAuxKGE
         vzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ROjQzA+jaUJ6RDFw5s0vhKbojLmIUlPAj/k/QKIDWqQ=;
        b=FvD7P1Mju8iQlqGQcLHlSXL5MtAi5S3/Afhww5rJFKGYDSqeutJNs+eu6GhvHNVq/f
         uzxv7ZVroAJFOycuVTXCHidkM8NgsTyQXgX4Zh8BjUCuYCVfV0h8tKMTW4OEWOTajj2I
         0rf8KAuurO75740JQ+JrnI0Ao++LEFVC0wR6dGBMvCsThQvSlrHbvnJIO2cDc5C+s3Vp
         dj2jynhWYbHkOpDxi1gcx5C1RIzoYI4X23y1MOhrdRT3JqD19fIJSqxK8RKIOHtvpmZa
         5/lgBq+AE9n1LbUq3mCaxGueD54O7LelmwukQSvfHW6YdtUKugRv1d4ws6v3KjtLUwgq
         Mrbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMMmQMsWF6F/9gt34Lawa+6y9C5zdBUzsqFhyOuobT5Obqvmxf
	cJKpR60GROKBbBw5qmH6ltY=
X-Google-Smtp-Source: APXvYqx6IzLkM8G29bYSI5I1uS/ttr5Q009e8fszquYbA1p3LcAfE3kXsdnFbUvz2pRNZsTPIVzwlQ==
X-Received: by 2002:aca:d552:: with SMTP id m79mr46728010oig.3.1564162527455;
        Fri, 26 Jul 2019 10:35:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:afd2:: with SMTP id y201ls7498019oie.7.gmail; Fri, 26
 Jul 2019 10:35:26 -0700 (PDT)
X-Received: by 2002:aca:3158:: with SMTP id x85mr42868970oix.93.1564162526718;
        Fri, 26 Jul 2019 10:35:26 -0700 (PDT)
Date: Fri, 26 Jul 2019 10:35:25 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <942a4151-1921-4bd2-ad02-c9a98411ac36@googlegroups.com>
In-Reply-To: <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
 <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
 <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7763_355180868.1564162526070"
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

------=_Part_7763_355180868.1564162526070
Content-Type: multipart/alternative; 
	boundary="----=_Part_7764_738401464.1564162526070"

------=_Part_7764_738401464.1564162526070
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pyjailhouse was installed on /usr/local/lib/python2.7/dist-packages, and=20
that is the directory i have to add to the script in order for it to find=
=20
pyjailhouse.

sexta-feira, 26 de Julho de 2019 =C3=A0s 16:13:42 UTC+1, Jan Kiszka escreve=
u:
>
> On 26.07.19 16:31, Jo=C3=A3o Reis wrote:=20
> > I run make install, and using the scripts from installation directory=
=20
> >=20
>
> Check where pyjailhouse actually ended up - or if it was installed at all=
.=20
> As=20
> you can see from the Makefile, we just do=20
>
> pip install --upgrade --force-reinstall --root=3D<DESTDIR> .=20
>
> there. Provided, scripts/include.mk found out that it can set=20
> PYTHON_PIP_USABLE=20
> :=3D yes.=20
>
> Jan=20
>
> > quinta-feira, 25 de Julho de 2019 =C3=A0s 16:22:41 UTC+1, Jan Kiszka=20
> escreveu:=20
> >=20
> >     On 25.07.19 15:11, Jo=C3=A3o Reis wrote:=20
> >     > Another question that i have is: when i try to issue jailhouse=20
> cell linux, i=20
> >     > need to add to the script (jailhouse-cell-linux) the path of=20
> pyjailhouse=20
> >     > (sys.path.insert(0, "/usr/local/libexec/jailhouse")) otherwise it=
=20
> doesn't=20
> >     find=20
> >     > the module pyjailhouse.cell and it gives error.=20
> >     >=20
> >     > In pyjailhouse.md it says the following:=20
> >     >=20
> >     >     When we install any python script that uses pyjailhouse, we=
=20
> >     >     remove |sys.path[0] =3D os.path.dirname(...| from the install=
ed=20
> scripts,=20
> >     >     leaving python to import pyjailhouse from where pip installed=
=20
> it.=20
> >     >=20
> >     > but it seems python doesn't find the path and i need to add the=
=20
> path=20
> >     everytime i=20
> >     > want to use jailhouse cell linux.  =20
> >     >=20
> >=20
> >     Did you run "make install", or are you running jailhouse from the=
=20
> code=20
> >     repository? Both are supposed to work without patching. Anything=20
> else not.=20
> >=20
> >     Jan=20
> >=20
> >     --=20
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/942a4151-1921-4bd2-ad02-c9a98411ac36%40googlegroups.com.

------=_Part_7764_738401464.1564162526070
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">pyjailhouse was installed on=C2=A0/usr/local/lib/python2.7=
/dist-packages, and that is the directory i have to add to the script in or=
der for it to find pyjailhouse.<br><br>sexta-feira, 26 de Julho de 2019 =C3=
=A0s 16:13:42 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" =
style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-l=
eft: 1ex;">On 26.07.19 16:31, Jo=C3=A3o Reis wrote:
<br>&gt; I run make install, and using the scripts from installation direct=
ory
<br>&gt;=20
<br>
<br>Check where pyjailhouse actually ended up - or if it was installed at a=
ll. As
<br>you can see from the Makefile, we just do
<br>
<br>pip install --upgrade --force-reinstall --root=3D&lt;DESTDIR&gt; .
<br>
<br>there. Provided, scripts/<a href=3D"http://include.mk" target=3D"_blank=
" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/ur=
l?q\x3dhttp%3A%2F%2Finclude.mk\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNE8_8=
lJCg7QHyS5Q4qInzN6zhlBYQ&#39;;return true;" onclick=3D"this.href=3D&#39;htt=
p://www.google.com/url?q\x3dhttp%3A%2F%2Finclude.mk\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNE8_8lJCg7QHyS5Q4qInzN6zhlBYQ&#39;;return true;">include.mk=
</a> found out that it can set PYTHON_PIP_USABLE
<br>:=3D yes.
<br>
<br>Jan
<br>
<br>&gt; quinta-feira, 25 de Julho de 2019 =C3=A0s 16:22:41 UTC+1, Jan Kisz=
ka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 25.07.19 15:11, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Another question that i have is: when i try to =
issue jailhouse cell linux, i
<br>&gt; =C2=A0 =C2=A0 &gt; need to add to the script (jailhouse-cell-linux=
) the path of pyjailhouse
<br>&gt; =C2=A0 =C2=A0 &gt; (sys.path.insert(0, &quot;/usr/local/libexec/ja=
ilhouse&quot;<wbr>))=C2=A0otherwise it doesn&#39;t
<br>&gt; =C2=A0 =C2=A0 find
<br>&gt; =C2=A0 =C2=A0 &gt; the module pyjailhouse.cell and it gives error.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; In pyjailhouse.md it says the following:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 When we install any python script=
 that uses pyjailhouse, we
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 remove=C2=A0|sys.path[0] =3D os.p=
ath.dirname(...|=C2=A0from the installed scripts,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 leaving python to import pyjailho=
use from where pip installed it.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; but it seems python doesn&#39;t find the path a=
nd i need to add the path
<br>&gt; =C2=A0 =C2=A0 everytime i
<br>&gt; =C2=A0 =C2=A0 &gt; want to use jailhouse cell linux.=C2=A0=C2=A0
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Did you run &quot;make install&quot;, or are you run=
ning jailhouse from the code
<br>&gt; =C2=A0 =C2=A0 repository? Both are supposed to work without patchi=
ng. Anything else not.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 --=20
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/942a4151-1921-4bd2-ad02-c9a98411ac36%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/942a4151-1921-4bd2-ad02-c9a98411ac36%40googlegroups.com<=
/a>.<br />

------=_Part_7764_738401464.1564162526070--

------=_Part_7763_355180868.1564162526070--
