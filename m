Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBRVB3D5AKGQEOWWYULI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id D561B25F8D9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:51:51 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id y30sf7454722qvy.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yrwy+ZRppLXWOnG44zvZmOXCSnibJPPl9u99b7+R5h8=;
        b=YNq4ARp4RCchWbFEnc/trESMRag1do4MPWoGol2xcJ4QXljVvqRPYNytbyaCpMtGTn
         HEecwwV3STl9ewVTbxkdI+p8goz8UMEleYkg5axYRCyZBn+gkNORTHf9v/5AjXcIOfe/
         wGPnCK1QX3oLqQXD/7QYPEBajcgISR5bZh+QuvtGoP4yGZo9Z3DTwKfQzytaDyzXxN3P
         eTgNEmgE2DmaLICdiKND8bkDuZH3pq1C1GKSnLXuywxR6R29PkTXNiRCOt4JzlU/YPQW
         pkibxptIItAYncvPB357C46xdqvLzpvQs/9NXIviE5cb3Nzh04pMOHj/D+jU0w3oCkxH
         MnXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yrwy+ZRppLXWOnG44zvZmOXCSnibJPPl9u99b7+R5h8=;
        b=gwLkxMLDQH7SP5gVYfD2835cyf5woSYmVZa9hSSk0FtKGRDZWkhD2qpX9CMracOXz4
         XFE7FvapsurjUPSWitR5yWp9INpzboxc6sj/gvxCe5kBIVf7FWC1vCQSMw/IM0BpxQy2
         Whmtx7LcR+JXzeotAFXfUjN4EGpk+jP/nojx9AGaVzJU2e5ScebUdrz1mYwMTKqb18eG
         BMBvpJL2eZpu1EEzZmnl7M/T858JJwY/7FIMC30xb7n2KUOl+NLOaegaZeOXRihi7o2H
         ZUXQ+EUdRh6dnc5xRqa5XPjZKoonoZeoOUUJm10pfeswuOPwuezTJOer4zNMxSFZeop8
         LAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yrwy+ZRppLXWOnG44zvZmOXCSnibJPPl9u99b7+R5h8=;
        b=qwoZsT5qRBSsjTE6gAmUZzes/q1A5jZW1gpjqOTLUAuhAr0XgV6wtG0xaivTfwl4CY
         o+PqrHJ960qMmTPGKp/0KgIi8NOJku5w41RLMmNuRHBqVpdfQqXALw+rRu2OHr9W/MxW
         iiIPe/8IOA/rsCM8pSUEN5FHvtjvcyvtFpIcwzi0QHGDwciZiopb1g6oyLvUsEBHi34V
         fcnM9Gu0P0N6bUtlnDOECiEEb7X5ykDlWcjTxZgtHnY835ENHLHc7We7kY/U1w3pb2iN
         /EYzrf9DZ8QA/GmZXZF/NWI9RrY5vhWKD4NI7lX4JAE4zQIcBwX7xPOZ9+MkKjNY+iXh
         lolA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530yGOX2u+l1pyRnNjrMF4zy9NoWGzyi4xDQkAma213naDOhW+bA
	EdlS+nFppfhDBCTNkRin/jw=
X-Google-Smtp-Source: ABdhPJy/wTercWEKxfhJv7us6I2TGmisxdUjidlphltNTzkfx97U0NU/2tttGHidFNuwosGwpSGAWQ==
X-Received: by 2002:ac8:7b2c:: with SMTP id l12mr19416704qtu.98.1599475910924;
        Mon, 07 Sep 2020 03:51:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:146b:: with SMTP id j11ls7429479qkl.0.gmail; Mon,
 07 Sep 2020 03:51:50 -0700 (PDT)
X-Received: by 2002:a37:8601:: with SMTP id i1mr19364474qkd.307.1599475910162;
        Mon, 07 Sep 2020 03:51:50 -0700 (PDT)
Date: Mon, 7 Sep 2020 03:51:49 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
In-Reply-To: <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
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
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_148_759380331.1599475909295"
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

------=_Part_148_759380331.1599475909295
Content-Type: multipart/alternative; 
	boundary="----=_Part_149_93580303.1599475909295"

------=_Part_149_93580303.1599475909295
Content-Type: text/plain; charset="UTF-8"

Running 

# python 
>>> from mako.template import Template 

I get a lot of traceback messages.
The last message is "ModuleNotFoundError: not module named 'json'".
This message comes from "/usr/lib/python3.7/site-packages/mako/compat.py" 
(line 140: "import json  # noqa").



j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 um 12:41:52 
UTC+2:

> On 07.09.20 12:28, Jan-Marc Stranz wrote:
> > The line
> > #!/usr/bin/env python3
> >  is already included in script
> > "/usr/libexec/jailhouse/jailhouse-config-create" as first line!
>
> Was apparently patched by the installation procedure of Yocto. Then you
> should be covered by the python3-mako support of Yocto. If not, it's
> likely a Yocto bug.
>
> We effectively just do this:
>
> # python
> >>> from mako.template import Template
>
> What does that report when run manually?
>
> Jan
>
> > 
> > I can not use a distro form SUSE or Debian.
> > I have to build our own distro with Yocto (here: "warrior").
> > And Yocto always installs "python" ("python2") and - as a runtime
> > dependency of "jailhouse" - "python3" and "python3-mako" also.
> > 
> > The is no package "python2-mako" at all; only "python-mako".
> > And the packages "python-mako" and "python3-mako" clash with the file
> > "/usr/bin/mako-render".
> > 
> > Has anyone already created a BSP with "jailhouse" using "Yocto" and
> > solved these problems?
> > 
> > j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 um 12:01:46
> > UTC+2:
> > 
> > On 07.09.20 11:23, Jan-Marc Stranz wrote:
> > > I've build a Linux kernel with CONFIG_STRICT_DEVMEM and
> > > CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still
> > not works.
> > > From now I'll ignore the hardware check.
> > >
> > > I've tried to create the configuration for the root cell on the
> > > targetwith " jailhouse config create sysconfig.c" without success.
> > > I get an error message "This script requires the mako library to
> > run".
> > >
> > > My root-fs contains "python3-mako", but "python" ist still "python
> > 2.7.18".
> > > What version of python is the script unsing?
> > >
> > 
> > Distro default. Likely still python2.
> > 
> > > In my image recipe I can't add the package "python-mako" because
> > is is
> > > already provided by package "python3-mako".
> > > How do I get out of this dilemma again?
> > 
> > Try "python2-mako"? Or use a distro that does not have such problems:
> > 
> > SUSE:
> > python3-Mako-1.0.7-lp152.3.3.noarch
> > python2-Mako-1.0.7-lp152.3.3.noarch
> > 
> > Debian:
> > ii python-mako 1.0.7+ds1-1 all fast and lightweight templating for
> > the Python platform
> > ii python3-mako 1.0.7+ds1-1 all fast and lightweight templating for
> > the Python 3 platform
> > 
> > As a workaround, you may also write
> > 
> > #!/usr/bin/env python3
> > 
> > into tools/jailhouse-config-create.
> > 
> > Jan
> > 
> > -- 
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
> > 
> > -- 
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-de...@googlegroups.com
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.com?utm_medium=email&utm_source=footer
> >.
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/de0ebbce-9513-4820-8975-781f816f9841n%40googlegroups.com.

------=_Part_149_93580303.1599475909295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Running <br></div><div><br></div><div>
# python
<br>&gt;&gt;&gt; from mako.template import Template


</div><div><br></div><div>I get a lot of traceback messages.</div><div>The =
last message is "ModuleNotFoundError: not module named 'json'".</div><div><=
/div><div>This message comes from "/usr/lib/python3.7/site-packages/mako/co=
mpat.py" (line 140: "import json&nbsp; # noqa").</div><div><br></div><div><=
br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">j.kiszka...@gmail.com schrieb am Montag, 7. September 2020 =
um 12:41:52 UTC+2:<br/></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: =
1ex;">On 07.09.20 12:28, Jan-Marc Stranz wrote:
<br>&gt; The line
<br>&gt; #!/usr/bin/env python3
<br>&gt; =C2=A0is already included in script
<br>&gt; &quot;/usr/libexec/jailhouse/jailhouse-config-create&quot; as firs=
t line!
<br>
<br>Was apparently patched by the installation procedure of Yocto. Then you
<br>should be covered by the python3-mako support of Yocto. If not, it&#39;=
s
<br>likely a Yocto bug.
<br>
<br>We effectively just do this:
<br>
<br># python
<br>&gt;&gt;&gt; from mako.template import Template
<br>
<br>What does that report when run manually?
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; I can not use a distro form SUSE or Debian.
<br>&gt; I have to build our own distro with Yocto (here: &quot;warrior&quo=
t;).
<br>&gt; And Yocto always installs &quot;python&quot; (&quot;python2&quot;)=
 and - as a runtime
<br>&gt; dependency of &quot;jailhouse&quot; - &quot;python3&quot; and &quo=
t;python3-mako&quot; also.
<br>&gt;=20
<br>&gt; The is no package &quot;python2-mako&quot; at all; only &quot;pyth=
on-mako&quot;.
<br>&gt; And the packages &quot;python-mako&quot; and &quot;python3-mako&qu=
ot; clash with the file
<br>&gt; &quot;/usr/bin/mako-render&quot;.
<br>&gt;=20
<br>&gt; Has anyone already created a BSP with &quot;jailhouse&quot; using =
&quot;Yocto&quot; and
<br>&gt; solved these problems?
<br>&gt;=20
<br>&gt; <a href data-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</=
a> schrieb am Montag, 7. September 2020 um 12:01:46
<br>&gt; UTC+2:
<br>&gt;=20
<br>&gt;     On 07.09.20 11:23, Jan-Marc Stranz wrote:
<br>&gt;     &gt; I&#39;ve build a Linux kernel with CONFIG_STRICT_DEVMEM a=
nd
<br>&gt;     &gt; CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware chec=
k still
<br>&gt;     not works.
<br>&gt;     &gt; From now I&#39;ll ignore the hardware check.
<br>&gt;     &gt;
<br>&gt;     &gt; I&#39;ve tried to create the configuration for the root c=
ell on the
<br>&gt;     &gt; targetwith &quot; jailhouse config create sysconfig.c&quo=
t; without success.
<br>&gt;     &gt; I get an error message &quot;This script requires the mak=
o library to
<br>&gt;     run&quot;.
<br>&gt;     &gt;
<br>&gt;     &gt; My root-fs contains &quot;python3-mako&quot;, but &quot;p=
ython&quot; ist still &quot;python
<br>&gt;     2.7.18&quot;.
<br>&gt;     &gt; What version of python is the script unsing?
<br>&gt;     &gt;
<br>&gt;=20
<br>&gt;     Distro default. Likely still python2.
<br>&gt;=20
<br>&gt;     &gt; In my image recipe I can&#39;t add the package &quot;pyth=
on-mako&quot; because
<br>&gt;     is is
<br>&gt;     &gt; already provided by package &quot;python3-mako&quot;.
<br>&gt;     &gt; How do I get out of this dilemma again?
<br>&gt;=20
<br>&gt;     Try &quot;python2-mako&quot;? Or use a distro that does not ha=
ve such problems:
<br>&gt;=20
<br>&gt;     SUSE:
<br>&gt;     python3-Mako-1.0.7-lp152.3.3.noarch
<br>&gt;     python2-Mako-1.0.7-lp152.3.3.noarch
<br>&gt;=20
<br>&gt;     Debian:
<br>&gt;     ii python-mako 1.0.7+ds1-1 all fast and lightweight templating=
 for
<br>&gt;     the Python platform
<br>&gt;     ii python3-mako 1.0.7+ds1-1 all fast and lightweight templatin=
g for
<br>&gt;     the Python 3 platform
<br>&gt;=20
<br>&gt;     As a workaround, you may also write
<br>&gt;=20
<br>&gt;     #!/usr/bin/env python3
<br>&gt;=20
<br>&gt;     into tools/jailhouse-config-create.
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt;     Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/cc67408=
5-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dde&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-=
47593459c6f2n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D15995617971=
52000&amp;usg=3DAFQjCNExRC3fiSwh37FleexuWkkenGXRBw">https://groups.google.c=
om/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%40googlegrou=
ps.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/cc6=
74085-e9fe-4bd9-a591-47593459c6f2n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dde&amp;q=3Dhttps://groups.google.com=
/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2n%2540googlegrou=
ps.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=
=3D1599561797152000&amp;usg=3DAFQjCNElW3RcFP2fd31C65zO7j55aFny7w">https://g=
roups.google.com/d/msgid/jailhouse-dev/cc674085-e9fe-4bd9-a591-47593459c6f2=
n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/de0ebbce-9513-4820-8975-781f816f9841n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/de0ebbce-9513-4820-8975-781f816f9841n%40googlegroups.co=
m</a>.<br />

------=_Part_149_93580303.1599475909295--

------=_Part_148_759380331.1599475909295--
