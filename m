Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBHUR3DUQKGQEJIJWZYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E947093A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 21:04:00 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id a17sf22684259otd.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q8XMDzqJyfMwgcfYs0lEjILAi9z5+e5j/8Qu9Qj+yCw=;
        b=YZVFENuU8mUbLDgn+e4f6DxKaYG4lUcQ5RgW0OVQ9NXZoTJsTi1NzbG4teegApKRaa
         iOw0lCk/tfAwukwlGp3E89B0P1W0Q4eL1UyIIARGZP5WcvlB5Tq1zOnqx918jUkQL6tg
         7vAbHggjzvwNZ+THHhfmd3Z5L2XD7ujT181KljYBszRCCzcw9ufcKS1Lp8sdvSaldx0g
         otNjFvrwHSXTXeE1l3v3NGq+/nzfGSnpu5j2Yu5m/STfRBNYCrZxVf2ASEHXl1PLq/sI
         EsPnLncajpjU87XCI9B0AqEaO+F2riwhCbGE2QXaeIp/hxkF4o1NErt8ASu9m7eYJ4mQ
         /9jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q8XMDzqJyfMwgcfYs0lEjILAi9z5+e5j/8Qu9Qj+yCw=;
        b=OFbonu12pcrdJDD6o1q9gYzvsDlcBf+oFUkfHgS+0sD6dfZ4Vj1boLFeMN5Lvcna7v
         GDs15Yv+l+vth4MPebG46xalyIMojM+Wnpq0fXzUCcEHqt/1JE6RV/uHhkM/wDbZKc2O
         gjhnvySQCeiDlQjBGpqN21Inqnk1W/yy6/RHbiQQ+Wh/p+rlwdtEohqoqYUMslfJhqod
         3/8LD0L+3ZcN6VbhSh4CYhKvBC/pMPw1EezXKVSlTatfSm2km+DD13qs1bgkA5O37PdX
         Imo3OicwbvoFGkXgYJ8UQEbJd9XhLjC8tT7lVQXTGfC2c9+zJIoEXl5kpXpa7wB89W3Q
         gpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=q8XMDzqJyfMwgcfYs0lEjILAi9z5+e5j/8Qu9Qj+yCw=;
        b=tX9vRzhaeI4G9ocNZeGmV9AEEibqOxBAeeWYKB1NYfYir2uk4xD9PZWyoxhD/zZ6Na
         fQAUiGMysPEt17oEvFLy70pLspO1LBDOrhIiPqzMrYCVvIctHazBOlcOEkKHf04ZFHmH
         AGG7PYclm+YxdOxQEKy7DAuyc/hPk5pMoDf9gGTBgPKDAnbEX8heaNHaG27zrqZUNKxS
         jt9D+8nP1VsVNLhkk4a6PNXLRuZgOK5O3ABlYbK02n9Ib5yOqUy7LUqvn7nAMsGs5fAs
         gEc+aYTL/0WDCCQPD9SWC9oGoyF/o0wN0ZnWLjugCDFr9ompt0E7V63ncnQOQS5mBBZC
         uikQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX16MhKZEaJHazc0BzeJjwND+85hhqQdcoWrLx9i6Gbm/vp3l0k
	SSY7v8ErTgnOk79hIQ+6+jQ=
X-Google-Smtp-Source: APXvYqwuqMgYPTBCxZXHBiuAH0iFHHUpFf2icaJPx67w9YmCVXX5dhsa2hiwuIJ1xRb1CM+2r8B+fg==
X-Received: by 2002:aca:90d:: with SMTP id 13mr37088766oij.126.1563822238727;
        Mon, 22 Jul 2019 12:03:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:12c3:: with SMTP id g61ls7645459otg.16.gmail; Mon, 22
 Jul 2019 12:03:58 -0700 (PDT)
X-Received: by 2002:a9d:5d0b:: with SMTP id b11mr9529046oti.333.1563822237923;
        Mon, 22 Jul 2019 12:03:57 -0700 (PDT)
Date: Mon, 22 Jul 2019 12:03:57 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <62e48ed5-ad73-44b7-ab97-74516efdbac2@googlegroups.com>
In-Reply-To: <719d06c6-3e84-6cd0-85b5-28719dc8ef05@siemens.com>
References: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
 <03e07418-13ad-82ea-20fa-140edcc28bff@siemens.com>
 <523d1079-ea79-4aa2-ae37-678146ee54be@googlegroups.com>
 <719d06c6-3e84-6cd0-85b5-28719dc8ef05@siemens.com>
Subject: Re: JAILHOUSE_ENABLE: invalid argument error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5701_1802542276.1563822237382"
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

------=_Part_5701_1802542276.1563822237382
Content-Type: multipart/alternative; 
	boundary="----=_Part_5702_1075557948.1563822237382"

------=_Part_5702_1075557948.1563822237382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry for the inconvenience.

segunda-feira, 22 de Julho de 2019 =C3=A0s 10:12:31 UTC+1, Jan Kiszka escre=
veu:
>
> On 22.07.19 08:42, Jo=C3=A3o Reis wrote:=20
> > Regarding this problem there was no inconsistency in the build, it was=
=20
> my fault,=20
> > i just using .cell files from master branch instead of wip/coloring=20
> branch, that=20
> > was the problem.=20
>
> Ah, yeah - happens. Thank for clarifying!=20
>
> Jan=20
>
> >=20
> > segunda-feira, 22 de Julho de 2019 =C3=A0s 06:27:36 UTC+1, Jan Kiszka=
=20
> escreveu:=20
> >=20
> >     On 20.07.19 19:19, Jo=C3=A3o Reis wrote:=20
> >     > Hello,=20
> >     >=20
> >     > I am trying to use coloring on my board, using branch=20
> wip/coloring, but=20
> >     when i=20
> >     > issue "jailhouse enable root_cell.cell", the console outputs=20
> >     "JAILHOUSE_ENABLE:=20
> >     > invalid argument".=20
> >     >=20
> >     > I've modified drivers/main.c to printk some steps, and i've=20
> noticied that the=20
> >     > jailhouse.ko generated from wip/coloring branch doesn't get the=
=20
> right value=20
> >     > for config_header.root_cell.cpu_set_size on jailhouse_cmd_enable(=
)=20
> function.=20
> >     > The value for config_header.root_cell.cpu_set_size should be 8=20
> bytes (it=20
> >     comes=20
> >     > from root cell config file) but somehow it reads 0 bytes.=20
> >     >=20
> >     > root cell config file.c=20
> >     >=20
> >     >     ....=20
> >     >     __u64 cpus[1];=20
> >     >     ...=20
> >     >     .cpu_set_size =3D sizeof(config.cpus);=20
> >     >     ...=20
> >     >=20
> >     >=20
> >     >=20
> >     > When i use the master branch, within jailhouse_cmd_enable(), it=
=20
> reads=20
> >     correctly=20
> >     > 8 bytes from config_header.root_cell.cpu_set_size, but with=20
> wip/coloring=20
> >     branch,=20
> >     > it reads 0 bytes from the same config file.=20
> >     >=20
> >=20
> >     Maybe some inconsistency in the build? I'm checking back with the=
=20
> folks for who=20
> >     I created that branch for testing purposes (we are still awaiting a=
=20
> rework from=20
> >     the authors), if it was working fine for them.=20
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
jailhouse-dev/62e48ed5-ad73-44b7-ab97-74516efdbac2%40googlegroups.com.

------=_Part_5702_1075557948.1563822237382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry for the inconvenience.<br><br>segunda-feira,=
 22 de Julho de 2019 =C3=A0s 10:12:31 UTC+1, Jan Kiszka escreveu:<blockquot=
e class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: =
1px #ccc solid;padding-left: 1ex;">On 22.07.19 08:42, Jo=C3=A3o Reis wrote:
<br>&gt; Regarding this problem there was no inconsistency in the build, it=
 was my fault,
<br>&gt; i just using .cell files from master branch instead of wip/colorin=
g branch, that
<br>&gt; was the problem.
<br>
<br>Ah, yeah - happens. Thank for clarifying!
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; segunda-feira, 22 de Julho de 2019 =C3=A0s 06:27:36 UTC+1, Jan Kis=
zka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 20.07.19 19:19, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Hello,
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; I am trying to use coloring on my board, using =
branch wip/coloring, but
<br>&gt; =C2=A0 =C2=A0 when i
<br>&gt; =C2=A0 =C2=A0 &gt; issue &quot;jailhouse enable root_cell.cell&quo=
t;, the console outputs
<br>&gt; =C2=A0 =C2=A0 &quot;JAILHOUSE_ENABLE:
<br>&gt; =C2=A0 =C2=A0 &gt; invalid argument&quot;.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; I&#39;ve modified drivers/main.c to printk some=
 steps, and i&#39;ve noticied that the
<br>&gt; =C2=A0 =C2=A0 &gt; jailhouse.ko generated from wip/coloring branch=
 doesn&#39;t get the right value
<br>&gt; =C2=A0 =C2=A0 &gt; for=C2=A0config_header.root_cell.<wbr>cpu_set_s=
ize on=C2=A0jailhouse_cmd_enable() function.
<br>&gt; =C2=A0 =C2=A0 &gt; The value for config_header.root_cell.cpu_<wbr>=
set_size should be 8 bytes (it
<br>&gt; =C2=A0 =C2=A0 comes
<br>&gt; =C2=A0 =C2=A0 &gt; from root cell config file) but somehow it read=
s 0 bytes.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; root cell config file.c
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 ....
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 __u64 cpus[1];
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 ...
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 .cpu_set_size =3D sizeof(config.c=
pus);
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 ...
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; When i use the master branch, within jailhouse_=
cmd_enable(), it reads
<br>&gt; =C2=A0 =C2=A0 correctly
<br>&gt; =C2=A0 =C2=A0 &gt; 8 bytes from config_header.root_cell.cpu_<wbr>s=
et_size, but with wip/coloring
<br>&gt; =C2=A0 =C2=A0 branch,
<br>&gt; =C2=A0 =C2=A0 &gt; it reads 0 bytes from the same config file.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Maybe some inconsistency in the build? I&#39;m check=
ing back with the folks for who
<br>&gt; =C2=A0 =C2=A0 I created that branch for testing purposes (we are s=
till awaiting a rework from
<br>&gt; =C2=A0 =C2=A0 the authors), if it was working fine for them.
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
om/d/msgid/jailhouse-dev/62e48ed5-ad73-44b7-ab97-74516efdbac2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/62e48ed5-ad73-44b7-ab97-74516efdbac2%40googlegroups.com<=
/a>.<br />

------=_Part_5702_1075557948.1563822237382--

------=_Part_5701_1802542276.1563822237382--
