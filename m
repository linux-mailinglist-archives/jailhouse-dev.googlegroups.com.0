Return-Path: <jailhouse-dev+bncBD7236HKXYJRBCMRST5AKGQE5HDAQMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61F2518DC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 14:48:10 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id d19sf8566860qvm.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jtbNVR4IQWnk2sk4j8YuyzOUstSmk9DqECifoUiCzhs=;
        b=gnhfFq0dQmSWABcn/F1Dp3tgOO62GfSmvFgl9XsbSOySB2V/mHfQjO/AjtXLmIjP6l
         vYueZoR73e4wvoxB7apy87eo5ppf3eK+zFJm0dyp0X/zbrWeFbbxwl1UTZENsg5mV8Re
         9GMpR9EqJf4JV89i5Nw1naKaUIPs1E0A1bNZ/YvwCb8FU1GW64GVUEnHczCdu+ju3lke
         FGEdpxJQOVzDOErElrC+QjF95h610fA0Re9Ng0em01BDqiLJP4JodzhrDQQRnAz92hhV
         nYujvXXmYnrDwMc0i6rGdSv73hVYwU21vJz3ac9uzccHc3QbOD+VX3VdH4hz0mCAHnR3
         7hwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jtbNVR4IQWnk2sk4j8YuyzOUstSmk9DqECifoUiCzhs=;
        b=h+7UoSDCXDeaZC7wmDT0J7/g+/kNWaMXk08LDHVbRfVmrxb7enaeAMTg+QG5TdzPpq
         nTluVV7pPtflx9EKGG15zDkdAGhRThmMqHdKGuQxS4/Idjw5mCjsBOMcPGRhbMwrhsUu
         uqUvY/s8Np8K0rQ7stw4zX97vC5WsX95pd/ZlCZUFKSbUe9pp8FbDiMfB5gScc0g47yk
         md1yobCZUcmKq1RzK5CtRJjs088rBqCeyDKRgrEiT68J2GptVYmyLIEhYsk6n5WAbSpl
         hlPhwPait1aQQ7AsyG4DIFaOgL6+vgbJvb3uimq0oX+3U2wzewnlCePKIB3f2L5+l05I
         I6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jtbNVR4IQWnk2sk4j8YuyzOUstSmk9DqECifoUiCzhs=;
        b=SONXWxydCTZsDsnESwsZ7mcoysd+V2c9lm+CqNPzjCi0qhxW1J+ZZZOUohtfk8K9z9
         UJuokL0BTucGZwJHF6xDZaLzE3tSJPcmhh7miYCcy798YlsVZ/7peS5AX+BfrPKKUUpI
         59tJdgieEUYvtqnu230utmkDyQRNbwmdTkWVcTscQIKnZZfz1nrNbkMepDjS0jIK9J3J
         Rl6q/uR186DVI+gzKiGFvHi59ItpYzRvtZ1hw2dp85BCukaDDWkmaapXf0GTP/X/4y9h
         RlWxT6P9kBzEmlMq/XwEee1TJeXZRUdlZPN5fEi9AwGgvMIRgoaXwv0HCPmUmAPHwXHk
         /qDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oblSj33ViBZ6T4+re7zAzVYjAtGPTx1WRAqgnw0HdaHOGridN
	s+EmRxUkOpTQagC9EBkKJTY=
X-Google-Smtp-Source: ABdhPJxNoMxikPbkn+9Mu//boHbCvat9/Yt5v+UCATuDfuyRhHtSbRWhvUxokUFK6yNqZOcSe58jMQ==
X-Received: by 2002:ac8:4643:: with SMTP id f3mr9266087qto.128.1598359689582;
        Tue, 25 Aug 2020 05:48:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4ea4:: with SMTP id ed4ls3104839qvb.11.gmail; Tue, 25
 Aug 2020 05:48:09 -0700 (PDT)
X-Received: by 2002:a0c:f702:: with SMTP id w2mr8900087qvn.152.1598359688791;
        Tue, 25 Aug 2020 05:48:08 -0700 (PDT)
Date: Tue, 25 Aug 2020 05:48:08 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bddbb89a-01c3-4d34-9821-405ec8dcffe5n@googlegroups.com>
In-Reply-To: <335079f2-a73e-fad0-a446-4dc9d13f00d4@siemens.com>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
 <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
 <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
 <335079f2-a73e-fad0-a446-4dc9d13f00d4@siemens.com>
Subject: Re: [PATCH-set] pyjailhouse: config_parser - jailhouse cell linux
 throws an error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_540_439021250.1598359688127"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_540_439021250.1598359688127
Content-Type: multipart/alternative; 
	boundary="----=_Part_541_1562389059.1598359688127"

------=_Part_541_1562389059.1598359688127
Content-Type: text/plain; charset="UTF-8"

nope,
changed to:

Traceback (most recent call last):
  File "tools/jailhouse-cell-linux", line 723, in <module>
    config = config_parser.CellConfig.parse(args.config.read())
  File "tools/../pyjailhouse/config_parser.py", line 214, in parse
    self = cls.parse_class(cls, stream)
  File "tools/../pyjailhouse/config_parser.py", line 50, in parse_class
    data_tuple = fmt.unpack_from(stream.read(fmt.size))
AttributeError: 'bytes' object has no attribute 'read'


j.kiszka...@gmail.com schrieb am Dienstag, 25. August 2020 um 12:20:10 
UTC+2:

> On 25.08.20 10:37, contact....@gmail.com wrote:
> > At the current head of the next branch, jailhouse cell linux throws  an
> > error:
> > 
> > Traceback (most recent call last):
> >   File "tools/jailhouse-cell-linux", line 723, in <module>
> >     config = config_parser.CellConfig(args.config.read())
> > TypeError: __init__() takes 1 positional argument but 2 were given
> > 
> > Thorsten
> > 
> > PS sorry for probably replying to the wrong patch-thread
> > 
>
> No problem - thanks for reporting!
>
> This comes from "pyjailhouse: config_parser: move parsing into class 
> methods". Does this help?
>
> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
> index 4178d4e0..aab82a5e 100755
> --- a/tools/jailhouse-cell-linux
> +++ b/tools/jailhouse-cell-linux
> @@ -720,7 +720,7 @@ except IOError as e:
> arch = resolve_arch(args.arch)
>
> try:
> - config = config_parser.CellConfig(args.config.read())
> + config = config_parser.CellConfig.parse(args.config.read())
> except RuntimeError as e:
> print(str(e) + ": " + args.config.name, file=sys.stderr)
> exit(1)
>
> Then I will fold it into Andrej's commit.
>
> Jan
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-405ec8dcffe5n%40googlegroups.com.

------=_Part_541_1562389059.1598359688127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>nope,</div><div></div><div>changed to:</div><div><br></div><div>Traceb=
ack (most recent call last):<br>&nbsp; File "tools/jailhouse-cell-linux", l=
ine 723, in &lt;module&gt;<br>&nbsp;&nbsp;&nbsp; config =3D config_parser.C=
ellConfig.parse(args.config.read())<br>&nbsp; File "tools/../pyjailhouse/co=
nfig_parser.py", line 214, in parse<br>&nbsp;&nbsp;&nbsp; self =3D cls.pars=
e_class(cls, stream)<br>&nbsp; File "tools/../pyjailhouse/config_parser.py"=
, line 50, in parse_class<br>&nbsp;&nbsp;&nbsp; data_tuple =3D fmt.unpack_f=
rom(stream.read(fmt.size))<br>AttributeError: 'bytes' object has no attribu=
te 'read'<br><br></div><br><div class=3D"gmail_quote"><div dir=3D"auto" cla=
ss=3D"gmail_attr">j.kiszka...@gmail.com schrieb am Dienstag, 25. August 202=
0 um 12:20:10 UTC+2:<br/></div><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">On 25.08.20 10:37, <a href data-email-masked rel=3D"nofollow">conta=
ct....@gmail.com</a> wrote:
<br>&gt; At the current head of the next branch, jailhouse cell linux throw=
s=C2=A0 an
<br>&gt; error:
<br>&gt;=20
<br>&gt; Traceback (most recent call last):
<br>&gt; =C2=A0 File &quot;tools/jailhouse-cell-linux&quot;, line 723, in &=
lt;module&gt;
<br>&gt; =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig(args.config=
.read())
<br>&gt; TypeError: __init__() takes 1 positional argument but 2 were given
<br>&gt;=20
<br>&gt; Thorsten
<br>&gt;=20
<br>&gt; PS sorry for probably replying to the wrong patch-thread
<br>&gt;=20
<br>
<br>No problem - thanks for reporting!
<br>
<br>This comes from &quot;pyjailhouse: config_parser: move parsing into cla=
ss=20
<br>methods&quot;. Does this help?
<br>
<br>diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
<br>index 4178d4e0..aab82a5e 100755
<br>--- a/tools/jailhouse-cell-linux
<br>+++ b/tools/jailhouse-cell-linux
<br>@@ -720,7 +720,7 @@ except IOError as e:
<br> arch =3D resolve_arch(args.arch)
<br>=20
<br> try:
<br>-    config =3D config_parser.CellConfig(args.config.read())
<br>+    config =3D config_parser.CellConfig.parse(args.config.read())
<br> except RuntimeError as e:
<br>     print(str(e) + &quot;: &quot; + <a href=3D"http://args.config.name=
" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Dde&amp;q=3Dhttp://args.config.name&amp;source=3Dgmail&amp=
;ust=3D1598445899681000&amp;usg=3DAFQjCNHbeHkFvh9k7niQALRU_8_66MqAxQ">args.=
config.name</a>, file=3Dsys.stderr)
<br>     exit(1)
<br>
<br>Then I will fold it into Andrej&#39;s commit.
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
om/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-405ec8dcffe5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-405ec8dcffe5n%40googlegroups.co=
m</a>.<br />

------=_Part_541_1562389059.1598359688127--

------=_Part_540_439021250.1598359688127--
