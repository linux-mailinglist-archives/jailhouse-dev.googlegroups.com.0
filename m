Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBY4W3D5AKGQET67S3WQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56D25F833
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:28:52 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id l29sf7372110qve.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AJcyptA9uVRaAFY4+WLiQ6ubEGTm5zUfctkoj/F6Www=;
        b=Y7UixGIZtWnx5OgcQfxK0JFj9wlE4SvtST8RU2pF4LeWTSLvo4K6CrvSRc5DRpWGu9
         eXFTDMK+wvOJpKddPkhNzGNgtoyouzRm1E/dI9DP6h/vewcHnxGnUrPVUGJC3KhTq+gE
         Iit64aCXmOMaL74UtuVa4JtvsMCLuVL2A+UYOuuSUsfb9PjnMwlqzLH55YIpMUFxCWAC
         l/VDRzETW8KWrxhpe0VYoGuVg9mdGPSiImhSrU9W1HDKsIM5nB4Fyk+3mz7TqT0yxbyB
         frMOS75fWFviV6tfaVnfrXwkjWJPV6o+iHahkHbv/0H5h/KS/ONrElOyvgBcDajumHNB
         eADw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AJcyptA9uVRaAFY4+WLiQ6ubEGTm5zUfctkoj/F6Www=;
        b=oy6C7UDQTN8S9V0Wj+xea/+1oB118+MzFhrhct+/fwr+S5KmtcX5BLT20Z4iwf27Uv
         9ko2t1iQtRkmhUOlYgFPbWigk/Wj/liMdufST/IKZiVTVZksYppuPdDh+Xn6WwvLkBzb
         lxG64vCTj4rKavSk5ZNjSE7ViNg2WbGhMsHEpnScBQpbwQ9gueODQsr/4jM77kBqW5om
         tRRrNJLXnOIKKSC0dCPPSGyd1oEg/6d0JbwV0oq2QDe5uv3IVcJn05OFChOUZUCJShRI
         6cDi9ZuNmwztmAUzi28DIDJKQ0DFxX+IPlWrn+QbsZQm4Y3j+jZNV0VYeaS90Ni0V+Ma
         bhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AJcyptA9uVRaAFY4+WLiQ6ubEGTm5zUfctkoj/F6Www=;
        b=GdtibilnVA2els60wAEOqsvfrjZGqKlY+qd5NFqAqQvXSD9k+hPSjfEhYCzcsUPy85
         e5vDN/R4kKNkiZtwE8djzLhlWoa59BQtEiK0nav3nfySeSBaPclpi4qFpUdFseNhoNbS
         eol8uwxnG4eC82lQv78NVP0APnodMr95KaT7IVliJcX6Wk8yZf8hSpLAiUt+UTrkiWAW
         +FVInoMQdPUlISFN+1Dg5XWRTuU6zUoDX2+7JrBt49VuC9PVlcwrmmpeSzWHY+u6LHAf
         8cVZM22U8mzLAJaAbrI+BHJw5oLPe8w3eSl2iM/i3M32KgTRWjUgEMzTzTMU8j5jczzd
         1TMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WWrrLCh6wGsza+C/hL51y6AwnS1c4cwVT0Xy5z7BZYdZnb2UV
	QNLmOM/7V5tD7SgR9c0mBiQ=
X-Google-Smtp-Source: ABdhPJzEb2XtTFWqA38V7DSclEWEnLfDyhwi6DY18OEPzFCmH4CXqHbL6pURsuA5rsxfp67COU9+7A==
X-Received: by 2002:a05:620a:2082:: with SMTP id e2mr4049030qka.421.1599474531370;
        Mon, 07 Sep 2020 03:28:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:585:: with SMTP id 127ls7935210qkf.8.gmail; Mon, 07 Sep
 2020 03:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr18409957qkk.337.1599474530515;
        Mon, 07 Sep 2020 03:28:50 -0700 (PDT)
Date: Mon, 7 Sep 2020 03:28:49 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
In-Reply-To: <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2344_723765402.1599474529678"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2344_723765402.1599474529678
Content-Type: multipart/alternative; 
	boundary="----=_Part_2345_1619002745.1599474529678"

------=_Part_2345_1619002745.1599474529678
Content-Type: text/plain; charset="UTF-8"

The line 
#!/usr/bin/env python3 
 is already included in script 
"/usr/libexec/jailhouse/jailhouse-config-create" as first line!

I can not use a distro form SUSE or Debian.
I have to build our own distro with Yocto (here: "warrior").
And Yocto always installs "python" ("python2") and - as a runtime 
dependency of "jailhouse" - "python3" and "python3-mako" also.

The is no package "python2-mako" at all; only "python-mako".
And the packages "python-mako" and "python3-mako" clash with the file 
"/usr/bin/mako-render".

Has anyone already created a BSP with "jailhouse" using "Yocto" and solved 
these problems?

j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 um 12:01:46 
UTC+2:

> On 07.09.20 11:23, Jan-Marc Stranz wrote:
> > I've build a Linux kernel with CONFIG_STRICT_DEVMEM and
> > CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still not 
> works.
> > From now I'll ignore the hardware check.
> > 
> > I've tried to create the configuration for the root cell on the
> > targetwith " jailhouse config create sysconfig.c" without success.
> > I get an error message "This script requires the mako library to run".
> > 
> > My root-fs contains "python3-mako", but "python" ist still "python 
> 2.7.18".
> > What version of python is the script unsing?
> > 
>
> Distro default. Likely still python2.
>
> > In my image recipe I can't add the package "python-mako" because is is
> > already provided by package "python3-mako".
> > How do I get out of this dilemma again?
>
> Try "python2-mako"? Or use a distro that does not have such problems:
>
> SUSE:
> python3-Mako-1.0.7-lp152.3.3.noarch
> python2-Mako-1.0.7-lp152.3.3.noarch
>
> Debian:
> ii python-mako 1.0.7+ds1-1 all fast and lightweight templating for the 
> Python platform
> ii python3-mako 1.0.7+ds1-1 all fast and lightweight templating for the 
> Python 3 platform
>
> As a workaround, you may also write
>
> #!/usr/bin/env python3
>
> into tools/jailhouse-config-create.
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.com.

------=_Part_2345_1619002745.1599474529678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>The line <br></div><div>
#!/usr/bin/env python3 <br></div><div>&nbsp;is already included in script "=
/usr/libexec/jailhouse/jailhouse-config-create" as first line!</div><div><b=
r></div><div>I can not use a distro form SUSE or Debian.</div><div>I have t=
o build our own distro with Yocto (here: "warrior").<br></div><div>And Yoct=
o always installs "python" ("python2") and - as a runtime dependency of "ja=
ilhouse" - "python3" and "python3-mako" also.</div><div><br></div><div>The =
is no package "python2-mako" at all; only "python-mako".<br></div><div>And =
the packages "python-mako" and "python3-mako" clash with the file "/usr/bin=
/mako-render".</div><div><br></div><div>
<div><div><span><span>Has anyone already created a BSP with "jailhouse" usi=
ng "Yocto" and solved these problems?</span></span></div></div></div><div><=
br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=
j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 um 12:01:46 UTC+=
2:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex=
; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 07.09.2=
0 11:23, Jan-Marc Stranz wrote:
<br>&gt; I&#39;ve build a Linux kernel with CONFIG_STRICT_DEVMEM and
<br>&gt; CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still n=
ot works.
<br>&gt; From now I&#39;ll ignore the hardware check.
<br>&gt;=20
<br>&gt; I&#39;ve tried to create the configuration for the root cell on th=
e
<br>&gt; targetwith &quot; jailhouse config create sysconfig.c&quot; withou=
t success.
<br>&gt; I get an error message &quot;This script requires the mako library=
 to run&quot;.
<br>&gt;=20
<br>&gt; My root-fs contains &quot;python3-mako&quot;, but &quot;python&quo=
t; ist still &quot;python 2.7.18&quot;.
<br>&gt; What version of python is the script unsing?
<br>&gt;=20
<br>
<br>Distro default. Likely still python2.
<br>
<br>&gt; In my image recipe I can&#39;t add the package &quot;python-mako&q=
uot; because is is
<br>&gt; already provided by package &quot;python3-mako&quot;.
<br>&gt; How do I get out of this dilemma again?
<br>
<br>Try &quot;python2-mako&quot;? Or use a distro that does not have such p=
roblems:
<br>
<br>SUSE:
<br>python3-Mako-1.0.7-lp152.3.3.noarch
<br>python2-Mako-1.0.7-lp152.3.3.noarch
<br>
<br>Debian:
<br>ii  python-mako     1.0.7+ds1-1  all          fast and lightweight temp=
lating for the Python platform
<br>ii  python3-mako    1.0.7+ds1-1  all          fast and lightweight temp=
lating for the Python 3 platform
<br>
<br>As a workaround, you may also write
<br>
<br>#!/usr/bin/env python3
<br>
<br>into tools/jailhouse-config-create.
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
om/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.co=
m</a>.<br />

------=_Part_2345_1619002745.1599474529678--

------=_Part_2344_723765402.1599474529678--
