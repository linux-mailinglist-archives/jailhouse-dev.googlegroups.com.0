Return-Path: <jailhouse-dev+bncBCLNDZG33ILRBXNO62VAMGQEF4EGSUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id D49457F3DC5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 06:53:35 +0100 (CET)
Received: by mail-pj1-x103a.google.com with SMTP id 98e67ed59e1d1-27ffe79ec25sf6749004a91.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 21:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700632414; x=1701237214; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:x-original-sender
         :mime-version:subject:references:in-reply-to:message-id:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1HntJZPaHdRSl5bNq8VdGyU/ex5lewTIWLq4dFjQpc=;
        b=AVDB9qcKaZt0u747mZtwwDspvl3O91jZEphPSVhrBB+oR+fYD1arJ/+RYQ0UuJgCT3
         cqY8WfzVM0nUDBivPEawsc0PvUkuh0L19zS3J9wpM1Lbha1fZ1bdvLsElqyi3ndodyjO
         e3Na5wrc7/ASz2GFm2UEdH9Bat0BaQvH43smBcCH3ZEuoC+56SquaTK3hyx19lN3lBlH
         Ki2WkwaItviuLnUjl0WB67WrpTdV/Zm2Ge4Of4ddS+RDK5N1xlnho7jBnAkWYqtiwLmI
         DBdxbKe02qmeAKKqHrmlzKe+Fcrm5flae2iMiuSx+IOhh4/EdYIQxOEf31yybrM9YKfW
         t/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700632414; x=1701237214;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1HntJZPaHdRSl5bNq8VdGyU/ex5lewTIWLq4dFjQpc=;
        b=nQL0iuzFAd12+nrcP2GmaDMx76krRWlM49O6ZL9sL7YFu3VgHH3h9ucccdTHSjjbiE
         XPfPpPBfYIDhLAkpctwmnVATSLG5NukLH57Q69CyCDbTb6VE5lrdhIc/BIm00c9r3v8I
         6jCuMJyMxjySz98pwRqnQV78MdomiEEhDpttL1FMeofInH2NdmYr5nNxW4crDQuMYjCe
         iEVdPSrjWJ1pih4rtV5xfUz+q82b0/16jSyi80N6TxLQ22Ad7vb4BX6lkozEV0qxViMw
         IGjn1I7gNG02vT0vFu8gTsaajZaN+IYqux/UMJVXhK/xPsFOOSLg3m8K9v4UKj9P0KFw
         e0yg==
X-Gm-Message-State: AOJu0YyOEtIUlLloRxSRDZzTBaN1KT1qES7O1ToiPYQvwg2PE4rzPNv9
	YHYpTjLJZ/AxbNuCzk4MEn8=
X-Google-Smtp-Source: AGHT+IEWVZXi+2bOWyDH4yhC2bIgv5hhjNoIRE+zZwGZxgtI/oyTeAfmjdx14dJwyZOyA5s3kDzT7A==
X-Received: by 2002:a17:90b:2387:b0:280:f4a:86b4 with SMTP id mr7-20020a17090b238700b002800f4a86b4mr1562203pjb.17.1700632414144;
        Tue, 21 Nov 2023 21:53:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:cf0f:b0:285:1e04:e92f with SMTP id
 h15-20020a17090acf0f00b002851e04e92fls811024pju.2.-pod-prod-05-us; Tue, 21
 Nov 2023 21:53:33 -0800 (PST)
X-Received: by 2002:a05:6a02:590:b0:5bd:d69b:6f8 with SMTP id by16-20020a056a02059000b005bdd69b06f8mr312303pgb.4.1700632412799;
        Tue, 21 Nov 2023 21:53:32 -0800 (PST)
Date: Tue, 21 Nov 2023 21:53:32 -0800 (PST)
From: =?UTF-8?B?J+W8oOW5sycgdmlhIEphaWxob3VzZQ==?= <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
In-Reply-To: <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
Subject: =?UTF-8?Q?Re:_arm_cortex_A55_support=EF=BC=9F?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_18102_798543062.1700632412127"
X-Original-Sender: 2022280902@qq.com
X-Original-From: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
Reply-To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
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

------=_Part_18102_798543062.1700632412127
Content-Type: multipart/alternative; 
	boundary="----=_Part_18103_574732964.1700632412127"

------=_Part_18103_574732964.1700632412127
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am trying to transplant jailhouse on the A55 core, but now I have=20
encountered some problems. After I execute the following command, the=20
system will freeze.
$ jailhouse enable renesas-r9a07g044l2.cell

What are the possible consequences?

I made sure I did the following:
1.Linux kernel version 5.10
2.Linux starts in EL2
3. Turn on KVM
4. Turn off kernel CONFIG_ARM64_VHE

Best regards
zhang,

=E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 11:04:24<Peng Fan> =E5=86=99=E9=81=93=EF=BC=9A

There is no difference to run jailhouse on A55 cores.

'=E5=BC=A0=E5=B9=B3' via Jailhouse <jailho...@googlegroups.com> =E4=BA=8E20=
23=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=81=93=
=EF=BC=9A


Hi All

I would like to know, are there any examples that are adapted to arm cortex=
=20
A55?
Or are there any SOCs that are arm cortex A55 and have successfully=20
transplanted the jailhouse program?

I saw that A57 and A53 products have suppressed jailhouse applications, but=
=20
I didn=E2=80=99t see A55?

Cheers,
Zhang

--=20
You received this message because you are subscribed to the Google Groups=
=20
"Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an=
=20
email to jailhouse-de...@googlegroups.com.
To view this discussion on the web visit=20
https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef6=
7bb1bf4b3n%40googlegroups.com=20
<https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef=
67bb1bf4b3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
.



--=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n%40googlegroups.com.

------=_Part_18103_574732964.1700632412127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am trying to transplant jailhouse on the A55 core, but now I have encount=
ered some problems. After I execute the following command, the system will =
freeze.<br />$ jailhouse enable renesas-r9a07g044l2.cell<br /><br />What ar=
e the possible consequences?<br /><br />I made sure I did the following:<br=
 />1.Linux kernel version 5.10<br />2.Linux starts in EL2<br />3. Turn on K=
VM<br />4. Turn off kernel CONFIG_ARM64_VHE<div><br /></div><div><span styl=
e=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91=
, sans-serif; font-size: small;">Best regards</span></div><div><font color=
=3D"#000000" face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91, sans-serif" size=
=3D"2">zhang,</font></div><br /><div><div dir=3D"auto">=E5=9C=A82023=E5=B9=
=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 11:04:24&lt;Peng=
 Fan&gt; =E5=86=99=E9=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin=
: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;"><div dir=3D"ltr">There is no difference to run jailhouse on A55 co=
res.</div><br /><div><div dir=3D"ltr">'=E5=BC=A0=E5=B9=B3' via Jailhouse &l=
t;<a href=3D"" rel=3D"nofollow">jailho...@googlegroups.com</a>&gt; =E4=BA=
=8E2023=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=
=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"></blockquote=
></div><div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;"><br />Hi All<br /><br />I w=
ould like to know, are there any examples that are adapted to arm cortex A5=
5?<br />Or are there any SOCs that are arm cortex A55 and have successfully=
 transplanted the jailhouse program?<br /><br />I saw that A57 and A53 prod=
ucts have suppressed jailhouse applications, but I didn=E2=80=99t see A55?<=
br /><br />Cheers,<br />Zhang<br />

<p></p></blockquote></div><div><blockquote style=3D"margin: 0px 0px 0px 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

-- <br />
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"" rel=3D"nofollow">jailhouse-de...@googlegroups.com</a>.=
<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c=
1b-ac78-ef67bb1bf4b3n%40googlegroups.com</a>.<br />
</blockquote></div><br clear=3D"all" /><div><br /></div><span>-- </span><br=
 /><div dir=3D"ltr"><div dir=3D"ltr"><br /></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n%40googlegroups.co=
m</a>.<br />

------=_Part_18103_574732964.1700632412127--

------=_Part_18102_798543062.1700632412127--
