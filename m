Return-Path: <jailhouse-dev+bncBCR7PPMN34DRB2NV2XUQKGQEFKRFGHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140B6F99C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 08:42:51 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id j4sf21796085otc.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Jul 2019 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zc1noOazFntZZ973t7rYLB/JGKITsjoPxDR+QDKTMMs=;
        b=PE1gCMrA6LwMSIGT1s/cE/OnG46uJ0D2VGgpIkmonkXxWMGuDcUD5NZGj+LrU2HlYP
         Cycj3rgWaN8SY4B06ttNIbUYyrM0SItEp6rLQRDqM+imUd7atkw+3Ugmb361uI/T1oP+
         X6TB3Pk9js24FXEOAoQtZ0ak3bmETjYNV+33XNY73k9cx6Zc95bTbtORPVRaoyk3T5X7
         uEHPsnrXQuzZtxYrpYgZDEt9iNp6tDb91I6WcJgPVU1oNWsT+ZPSs3Pw48sTiDSmexd7
         i78XAbuP5pHkNb7yxWERLs3gOO7p6/6HYgAtwcAWDPUbslVpY9Yjq9mN0jzIBIdDWV35
         qjMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zc1noOazFntZZ973t7rYLB/JGKITsjoPxDR+QDKTMMs=;
        b=Ld3nWVMVk9NwgZCLdWYQHyjoo23vb4f2g71s8PpxXEc+5JiafyU0K2DxFav1jxga+u
         4MnsZ33041gWHvvO6//YiD0dwzAgt6KDLjqGST9Y0EL2ifQlCYi081aDuz4tVTHo9NMP
         LDYzycXY4VDxxlsFVT7jAc7Iav24EJzMiivPYfJAgn5cxYjmU+9ux/iMfwIRVqku4mlm
         6qRCemisPRQfTstbDv9LRCJkQFBzoU26oSJa0mNcHr3JdQfKaNGtqnyn0mRyAoqh+Zv+
         t3zEt/huYRZ1giGx7/Ox5+Sph6UmEpKH88nK9BjwmjKtZLBex4AgzzyhBJDiUVtmm4FX
         F45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zc1noOazFntZZ973t7rYLB/JGKITsjoPxDR+QDKTMMs=;
        b=KVZZ92qz7365F7Nhh4QegoJLszNFykr1gY5DjP7UtXbOUVjqdYeRlArmcoySETW758
         ybhbkkHuFf1BE+G+LZNYmdYc3gan30iB50nOsgNdvJ0k6iD79mTXMD3uvBcHNv2IR1CV
         vjdnmLLMl7kGZBbGH79PlHWShL2UochhAU95WZptHe60xZGd/YJZB3KUKjqE6tSoZFlh
         DlSFDFJnRlvxT76RakzpwgU8aIugl+F1l2hdUMykmpedJQcIbOm0ecMaz8KxoK4QT57/
         EYNc+YHLK8/4z9IqNJSaaNmEhtMczCoVTYxAGvxmW5kgDxoFypzCh0XBwekgoUvOYND8
         rvrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdKOaVS3JaJfSXCY4JBaB2bytbkMgskLLvXypJvmzs+brhSyEa
	asghLQLTNWXiJ5MOKboGSWE=
X-Google-Smtp-Source: APXvYqzmP8lIRfiNgaNXXollIRQJjOseQ+C6l/+1v/QZqrRZQTnF3I6Q7gOyoIiH6ugDTQNF449B5Q==
X-Received: by 2002:aca:f582:: with SMTP id t124mr33876435oih.71.1563777769865;
        Sun, 21 Jul 2019 23:42:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:60d7:: with SMTP id b23ls7215622otk.14.gmail; Sun, 21
 Jul 2019 23:42:49 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr30315681oth.150.1563777769235;
        Sun, 21 Jul 2019 23:42:49 -0700 (PDT)
Date: Sun, 21 Jul 2019 23:42:48 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <523d1079-ea79-4aa2-ae37-678146ee54be@googlegroups.com>
In-Reply-To: <03e07418-13ad-82ea-20fa-140edcc28bff@siemens.com>
References: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
 <03e07418-13ad-82ea-20fa-140edcc28bff@siemens.com>
Subject: Re: JAILHOUSE_ENABLE: invalid argument error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5375_484195572.1563777768330"
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

------=_Part_5375_484195572.1563777768330
Content-Type: multipart/alternative; 
	boundary="----=_Part_5376_1393117438.1563777768331"

------=_Part_5376_1393117438.1563777768331
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regarding this problem there was no inconsistency in the build, it was my=
=20
fault, i just using .cell files from master branch instead of wip/coloring=
=20
branch, that was the problem.

segunda-feira, 22 de Julho de 2019 =C3=A0s 06:27:36 UTC+1, Jan Kiszka escre=
veu:
>
> On 20.07.19 19:19, Jo=C3=A3o Reis wrote:=20
> > Hello,=20
> >=20
> > I am trying to use coloring on my board, using branch wip/coloring, but=
=20
> when i=20
> > issue "jailhouse enable root_cell.cell", the console outputs=20
> "JAILHOUSE_ENABLE:=20
> > invalid argument".=20
> >=20
> > I've modified drivers/main.c to printk some steps, and i've noticied=20
> that the=20
> > jailhouse.ko generated from wip/coloring branch doesn't get the right=
=20
> value=20
> > for config_header.root_cell.cpu_set_size on jailhouse_cmd_enable()=20
> function.=20
> > The value for config_header.root_cell.cpu_set_size should be 8 bytes (i=
t=20
> comes=20
> > from root cell config file) but somehow it reads 0 bytes.=20
> >=20
> > root cell config file.c=20
> >=20
> >     ....=20
> >     __u64 cpus[1];=20
> >     ...=20
> >     .cpu_set_size =3D sizeof(config.cpus);=20
> >     ...=20
> >=20
> >=20
> >=20
> > When i use the master branch, within jailhouse_cmd_enable(), it reads=
=20
> correctly=20
> > 8 bytes from config_header.root_cell.cpu_set_size, but with wip/colorin=
g=20
> branch,=20
> > it reads 0 bytes from the same config file.=20
> >=20
>
> Maybe some inconsistency in the build? I'm checking back with the folks=
=20
> for who=20
> I created that branch for testing purposes (we are still awaiting a rewor=
k=20
> from=20
> the authors), if it was working fine for them.=20
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
jailhouse-dev/523d1079-ea79-4aa2-ae37-678146ee54be%40googlegroups.com.

------=_Part_5376_1393117438.1563777768331
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Regarding this problem there was no inconsistency in the b=
uild, it was my fault, i just using .cell files from master branch instead =
of wip/coloring branch, that was the problem.<br><br>segunda-feira, 22 de J=
ulho de 2019 =C3=A0s 06:27:36 UTC+1, Jan Kiszka escreveu:<blockquote class=
=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #cc=
c solid;padding-left: 1ex;">On 20.07.19 19:19, Jo=C3=A3o Reis wrote:
<br>&gt; Hello,
<br>&gt;=20
<br>&gt; I am trying to use coloring on my board, using branch wip/coloring=
, but when i
<br>&gt; issue &quot;jailhouse enable root_cell.cell&quot;, the console out=
puts &quot;JAILHOUSE_ENABLE:
<br>&gt; invalid argument&quot;.
<br>&gt;=20
<br>&gt; I&#39;ve modified drivers/main.c to printk some steps, and i&#39;v=
e noticied that the
<br>&gt; jailhouse.ko generated from wip/coloring branch doesn&#39;t get th=
e right value
<br>&gt; for=C2=A0config_header.root_cell.<wbr>cpu_set_size on=C2=A0jailhou=
se_cmd_enable() function.
<br>&gt; The value for config_header.root_cell.cpu_<wbr>set_size should be =
8 bytes (it comes
<br>&gt; from root cell config file) but somehow it reads 0 bytes.
<br>&gt;=20
<br>&gt; root cell config file.c
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 ....
<br>&gt; =C2=A0 =C2=A0 __u64 cpus[1];
<br>&gt; =C2=A0 =C2=A0 ...
<br>&gt; =C2=A0 =C2=A0 .cpu_set_size =3D sizeof(config.cpus);
<br>&gt; =C2=A0 =C2=A0 ...
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; When i use the master branch, within jailhouse_cmd_enable(), it re=
ads correctly
<br>&gt; 8 bytes from config_header.root_cell.cpu_<wbr>set_size, but with w=
ip/coloring branch,
<br>&gt; it reads 0 bytes from the same config file.
<br>&gt;=20
<br>
<br>Maybe some inconsistency in the build? I&#39;m checking back with the f=
olks for who
<br>I created that branch for testing purposes (we are still awaiting a rew=
ork from
<br>the authors), if it was working fine for them.
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
om/d/msgid/jailhouse-dev/523d1079-ea79-4aa2-ae37-678146ee54be%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/523d1079-ea79-4aa2-ae37-678146ee54be%40googlegroups.com<=
/a>.<br />

------=_Part_5376_1393117438.1563777768331--

------=_Part_5375_484195572.1563777768330--
