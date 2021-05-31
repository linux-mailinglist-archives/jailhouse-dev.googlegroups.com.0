Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRBV642GCQMGQEKD4S5PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B03954E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 07:04:25 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id em20-20020a17090b0154b029015d6b612e97sf9769436pjb.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 May 2021 22:04:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622437463; cv=pass;
        d=google.com; s=arc-20160816;
        b=puc1SLk5BT23OuuYkKHFVoNTdE3ox/m02l/V9GyYkewhyaGajo8OF0pNxazIrRUXjK
         eImkYAHj0TuGTn/kuloA8KssNB4kEhwnuoNw7pe1QeCqHVfl9SPNmOmSAvL2sT4vu85V
         0Mc+BjkFP+gzG3JjxuMAaZYkQEPM9eZnU7uVov/wnuntbwRM18Fyy6bDT7GolX8dF+zr
         dPbtIZs1bNpgO8tNMVxro7e+fiddIIh4KGVvvI/L0iPLTLJds7qbRI4ph0lJCVGdhs6f
         l2mdMJJtQxOkwyhVdMfRTFOdR3ziLVdia3jAL5xXCvvivzgIJofMdpXXIt37sUZNap+/
         h+Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=ioVxdvMmWeUmSzNrIzhSo3Uck211V/F6+AD3aJn2soQ=;
        b=wnZLoSGosS4rD1tLt8OXsTBeOg3VX9UWXWqO5O3eJ+UWfxBW4qSeM5jpRSJt2z12AH
         SXsntMPV20exbAzM/miUa9rnpwL0qCcmsdTea5q7X+aljdQcfI3QXp3DJOzXQUoSvoz7
         XJmUN7vSm/Q3Aw5YuUPWI0QpL/fExJHh3JgxzkWB5LVfEPKq/id5JkK2mbHaEjpqgJOU
         nSAtaDCh9bdGlTlQ9ohtTrrIQcAW+Kx21Fj++NneuvEMEkRQfywi7CZWTvRoNIO8LKim
         GZdgsQ+viplgqupBF61GeSaIFwdeJVy4aoWXBGOobdXpYoPSibB5TLe9dMmWJn9IiegK
         eCkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=wFQtKGSw;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::134 as permitted sender) smtp.mailfrom=kannan@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ioVxdvMmWeUmSzNrIzhSo3Uck211V/F6+AD3aJn2soQ=;
        b=DiQVixsAx46kFDp8+T26r+IQ382CGeOJRzOcJyVaDwqRGXnSj5D5yT77R+liGTBujb
         2fs09qbZL7omlrcN3VXE4Y6kJXtzxebAu41HeB18DmC7P0LtCeRG4rk4AMBqEZ7yq193
         IohLYQsjF+WvSWZaf8gwQ5nb0/e1zQCoVpLGKjj4RSf26lBc4rqGMsGyPFaSOPTwsr44
         Y96ifKIZYJW+6vP7SFKV5Sn0LDcfn9bBIASE/imovPAGF/SQg30C8IKwBHL881ArjzHM
         ke87TKKzaEDnVxIQ/18vJv0S8P5UzS2r86flT3b6xKIKQtU8OURowu6fCzMxLVyqi26T
         vNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ioVxdvMmWeUmSzNrIzhSo3Uck211V/F6+AD3aJn2soQ=;
        b=VdcOZDNqcO1mLX8b3O3/ZQM4M2tQ77YQOUzc9Gl7v0jHrsuKxjL5CuJpvHeV/LWcLG
         qewroQe/KqFpsuqbKU4NzTFl0XckYlZd+y0uEKzXWXNKpboZpjxdhOOm0R5/RYbidjKB
         wLdh5EmU3U53o0hA3RIVIpp4escv+Weh6J+2WI9twxUch9yYZso79hP7fTLqqeGOSFsw
         XRBY5EImyZ+gL6XXumRxBzR44HAqq3+PXyXsAy5SQUWmZwszaaBOTZuszi6WKGL4XPxX
         8GuEhSUkjqyRtugJbWEpYh41PmwBERxYhivaMcBcY9UuK906zKbOkNO55n+fwQV5PLdN
         mf9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530vMFSeQXnD7ndnu5MpGubErpHkcj1gyzvKg9EPC0rUDpAak5Sh
	dHA62Ih64A1QvvAWYcHdZIg=
X-Google-Smtp-Source: ABdhPJyjkyAihGkVFzKTdMKbCKuZYfqB8ayDVrQynBEcemmKtxc1R8Q6h22sbkfOGdMsAINxm0dqqw==
X-Received: by 2002:a63:974a:: with SMTP id d10mr21485255pgo.180.1622437463503;
        Sun, 30 May 2021 22:04:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:185:: with SMTP id z5ls7053485plg.6.gmail; Sun, 30
 May 2021 22:04:23 -0700 (PDT)
X-Received: by 2002:a17:902:6bc7:b029:ee:f84f:1093 with SMTP id m7-20020a1709026bc7b02900eef84f1093mr18648387plt.37.1622437462944;
        Sun, 30 May 2021 22:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622437462; cv=none;
        d=google.com; s=arc-20160816;
        b=nayYEHydbz5xNDfBvbtK0g5g3ORBOGdWEGgC/5VMA/XnWzpaCPBsuGq00e8oZKbzV+
         N/t9+t0cIy9bGEY6yjeQW8juS7PcrfZMRsZd4x1cmCPVyiNRrTp8jvWaZBYuj9rCTz7a
         X5gOzywXSjqkuTDIsjzDSgC72eetRswWnPXideXlXcXBCuiqTQTGju4MWm3oDlxKCxSW
         irG0xpYCHOkOsMX1GIPWxmhCRtWtCRH2kd3ZDQgoTuz3Kk9jGZ9W/leZaAOGyZOLcSjh
         aqy8FgHJnkMf8XUbrNmZWZRwEk/fkZOCEcDJDSqK/S7/pJ5v4KoklqAi7zCq+2+zQw0c
         uGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vrb8qZweaAkpnRcokvFRCOMNLN0SKAfDMUAAvVlUx7o=;
        b=doEXHkZsmqQboz6BayB35zM6osb1oSeCg4LlbbAPwYcEcBkowxq7cwVCHPOkFXej/Y
         ApDUNJ2WUiKHPlcK9/ck+5CDvk41iY4OY/LffHc3MUr5laE6vExT+8qm9/of74+C3c1Q
         kST4XtCTXf3xid8W7koqUhEkKhKAacLYhWqsIOzg1YvHURh0p3xsxX+HLlXI2UFusr6b
         QgMoo0rhfLsTt9de9O8bJVjr77RXgXr65s4hrdH/INidhAqiztNngrhk1gwaiThBAFGI
         dytumlKaTYSyGvbtfJ+JjGzJ38qiZQhSGBSQ/XhW+Q1iN/ZlchGG4jQUkSPO2/guo3dU
         9GoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=wFQtKGSw;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::134 as permitted sender) smtp.mailfrom=kannan@cimware.in
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com. [2607:f8b0:4864:20::134])
        by gmr-mx.google.com with ESMTPS id b24si1112691pfd.3.2021.05.30.22.04.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 22:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::134 as permitted sender) client-ip=2607:f8b0:4864:20::134;
Received: by mail-il1-x134.google.com with SMTP id z1so9026531ils.0
        for <jailhouse-dev@googlegroups.com>; Sun, 30 May 2021 22:04:22 -0700 (PDT)
X-Received: by 2002:a92:d24d:: with SMTP id v13mr7049619ilg.165.1622437461778;
 Sun, 30 May 2021 22:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
In-Reply-To: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
From: Kannan Sivaraman <kannan@cimware.in>
Date: Mon, 31 May 2021 10:34:20 +0530
Message-ID: <CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q@mail.gmail.com>
Subject: Re: Error when building jailhouse on debian - arm64
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000947b7905c39928f7"
X-Original-Sender: kannan@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=wFQtKGSw;       spf=pass (google.com: domain of kannan@cimware.in
 designates 2607:f8b0:4864:20::134 as permitted sender) smtp.mailfrom=kannan@cimware.in
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

--000000000000947b7905c39928f7
Content-Type: text/plain; charset="UTF-8"

Hi,
   Can anyone help me with this issue.

Thanks
Kannan

On Fri, May 28, 2021 at 10:52 AM Kannan Sivaraman <kannan@cimware.in> wrote:

> Good morning,
> I get the following error when building on Debian Linux - arm64 platform.
>
> Can someone help with this?
>
> make[5]: *** No rule to make target '/home/parallels/jh/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb', needed by '__build'.  Stop.
> make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.build:549: /home/parallels/jh/jailhouse/configs] Error 2
> make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _module_/home/parallels/jh/jailhouse] Error 2
> make[2]: *** [Makefile:146: sub-make] Error 2
> make[1]: *** [Makefile:8: all] Error 2
> make: *** [Makefile:40: modules] Error 2
>
> thanks,
>
> Kannan
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q%40mail.gmail.com.

--000000000000947b7905c39928f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0Can anyone help me with this issue.</=
div><div><br></div><div>Thanks</div><div>Kannan</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 28, 2021=
 at 10:52 AM Kannan Sivaraman &lt;<a href=3D"mailto:kannan@cimware.in">kann=
an@cimware.in</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div>Good morning,</div><div>I get the follow=
ing error when building on Debian Linux - arm64 platform.</div><div><br></d=
iv><div>Can someone help with this?<br></div><div><br></div><div><pre>make[=
5]: *** No rule to make target &#39;/home/parallels/jh/jailhouse/configs/ar=
m64/dts/inmate-amd-seattle.dtb&#39;, needed by &#39;__build&#39;.  Stop.
make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.buil=
d:549: /home/parallels/jh/jailhouse/configs] Error 2
make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _modul=
e_/home/parallels/jh/jailhouse] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:8: all] Error 2
make: *** [Makefile:40: modules] Error 2
<br><br></pre><pre>thanks,<br></pre><pre>Kannan<br></pre></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8M=
MdHrue9Q%40mail.gmail.com</a>.<br />

--000000000000947b7905c39928f7--
