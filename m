Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBLE55TUQKGQECGPEMXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49976BAD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 16:31:09 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id e11sf21175857oiy.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Aa0pVb/1ngZjiHCngL6UzwAcE7Vv3XI7KtoPbJouDfM=;
        b=likQv8UhzpmSMLu+8OZ2roxScCFuBI7OogfSZTx05flwwUecti6IkuyiqIytfScWxP
         rWo0vgl/pS9fGu+XvsXV/GuVZYd+PA95FCFrzv74PUCfQzDk0fvqHqKCnM/4snvl+Mtl
         cO34AuShQqOURRNezmxMzoEmfu7E6iHoMX8/toaSxZPtPEuuoibaZ2FQHmVa0a1nfo5d
         NufUNB0oUteWg8suYXjUej/YEI/mB5NVfr0507+Zb9NChB9XWd8fTq7MwQNPFg7FtSjB
         p/C52fEfGd1qE+H0BCmQN7uZDn5yEz3LFHf3VTOVU0dwBSJnGQL3GsWu6EYIAK1Vnbng
         sCFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Aa0pVb/1ngZjiHCngL6UzwAcE7Vv3XI7KtoPbJouDfM=;
        b=gFTrQFtDqJ3fYkdy9inP4qmvlnXoZLZdMMXTPg7UCTRxoH0xgzzrzV2PPIagLRe+Oq
         GsB/qXxz750js97884kbHoReAPFQXRfDG/VufH0YKZD+6lFr53wAlX8LhSDIo4qYPu/n
         TMU6Z/Dlf/5YBB3ap2wGm1Z1jYhBzDB9sOV1WUVDLiUVrWYGeJAqYrDW8x/SGy3uLqeI
         kIQe9OGSInn8N9Ib0MFykSIQHfQWbdj3fo4DDbJRX1pGI1MpFJWd/Lis8AW4PsWKLqTz
         QEtCWstIwE4Mf74VI8Kob0+jzrnE829SgDbNFKQnLYtMguYA1aVxxXmE0lbe/kn23bWg
         ANow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Aa0pVb/1ngZjiHCngL6UzwAcE7Vv3XI7KtoPbJouDfM=;
        b=qLrtWhmn/inTDOXMNKvgxwZY4voY2Tq4R2L7rjxAGrBApmlkX3Qi8aX5a/IgJqiuMk
         DgegmV2P4nswFk0To6rFAOajTzdSdxWwe1nnSWpvtaqXpT3hPhthJ5ufmy6peoyqQm8M
         dYjSyQiaz+G7oLr1lsAlchH+EOSVzL352EZTkdquxbZ2+W+Fv+wUaF9/n19t9yIcVb2Y
         bTIR9E3yWNpEVUksRHQzgkj7kopV0+2xumj3oFEQ92pOTl/sv5Z/8KNmIde20WwNjjtL
         ut1yxBmaCpF0kWyJLmDInmaluaHwFJS7FsiekunlLxEmMCKDw5htSJiXEHPE5cA6gfZJ
         dVpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuMh+odqmYLR00FMd+7Sgl9I4guxKk1QDYrg7gDbw9++AiZr4H
	K9VD7BI/okUt22EKzOusQBY=
X-Google-Smtp-Source: APXvYqxeVv44mS8qJ31eDaKFem2VAsolfhWgGbvo1H01k14MZK+iclGC2mjlR1tAhW1oi5cfCdm8uw==
X-Received: by 2002:aca:6044:: with SMTP id u65mr42790616oib.25.1564151468190;
        Fri, 26 Jul 2019 07:31:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:8e5:: with SMTP id d5ls2604780oic.9.gmail; Fri, 26
 Jul 2019 07:31:07 -0700 (PDT)
X-Received: by 2002:aca:5346:: with SMTP id h67mr41961584oib.55.1564151467745;
        Fri, 26 Jul 2019 07:31:07 -0700 (PDT)
Date: Fri, 26 Jul 2019 07:31:07 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
In-Reply-To: <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7666_898582771.1564151467182"
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

------=_Part_7666_898582771.1564151467182
Content-Type: multipart/alternative; 
	boundary="----=_Part_7667_1040531853.1564151467182"

------=_Part_7667_1040531853.1564151467182
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I run make install, and using the scripts from installation directory

quinta-feira, 25 de Julho de 2019 =C3=A0s 16:22:41 UTC+1, Jan Kiszka escrev=
eu:
>
> On 25.07.19 15:11, Jo=C3=A3o Reis wrote:=20
> > Another question that i have is: when i try to issue jailhouse cell=20
> linux, i=20
> > need to add to the script (jailhouse-cell-linux) the path of pyjailhous=
e=20
> > (sys.path.insert(0, "/usr/local/libexec/jailhouse")) otherwise it=20
> doesn't find=20
> > the module pyjailhouse.cell and it gives error.=20
> >=20
> > In pyjailhouse.md it says the following:=20
> >=20
> >     When we install any python script that uses pyjailhouse, we=20
> >     remove |sys.path[0] =3D os.path.dirname(...| from the installed=20
> scripts,=20
> >     leaving python to import pyjailhouse from where pip installed it.=
=20
> >=20
> > but it seems python doesn't find the path and i need to add the path=20
> everytime i=20
> > want to use jailhouse cell linux.  =20
> >=20
>
> Did you run "make install", or are you running jailhouse from the code=20
> repository? Both are supposed to work without patching. Anything else not=
.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/907a0d23-c664-432b-849f-8d536d14488f%40googlegroups.com.

------=_Part_7667_1040531853.1564151467182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I run make install, and using the scripts from installatio=
n directory<br><br>quinta-feira, 25 de Julho de 2019 =C3=A0s 16:22:41 UTC+1=
, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 25.07=
.19 15:11, Jo=C3=A3o Reis wrote:
<br>&gt; Another question that i have is: when i try to issue jailhouse cel=
l linux, i
<br>&gt; need to add to the script (jailhouse-cell-linux) the path of pyjai=
lhouse
<br>&gt; (sys.path.insert(0, &quot;/usr/local/libexec/jailhouse&quot;<wbr>)=
)=C2=A0otherwise it doesn&#39;t find
<br>&gt; the module pyjailhouse.cell and it gives error.
<br>&gt;=20
<br>&gt; In pyjailhouse.md it says the following:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 When we install any python script that uses pyjailho=
use, we
<br>&gt; =C2=A0 =C2=A0 remove=C2=A0|sys.path[0] =3D os.path.dirname(...|=C2=
=A0from the installed scripts,
<br>&gt; =C2=A0 =C2=A0 leaving python to import pyjailhouse from where pip =
installed it.
<br>&gt;=20
<br>&gt; but it seems python doesn&#39;t find the path and i need to add th=
e path everytime i
<br>&gt; want to use jailhouse cell linux.=C2=A0=C2=A0
<br>&gt;=20
<br>
<br>Did you run &quot;make install&quot;, or are you running jailhouse from=
 the code
<br>repository? Both are supposed to work without patching. Anything else n=
ot.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
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
om/d/msgid/jailhouse-dev/907a0d23-c664-432b-849f-8d536d14488f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/907a0d23-c664-432b-849f-8d536d14488f%40googlegroups.com<=
/a>.<br />

------=_Part_7667_1040531853.1564151467182--

------=_Part_7666_898582771.1564151467182--
