Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRB7WW2T3AKGQESFLXRLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 061091EA7C1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jun 2020 18:23:28 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id k91sf6286267otc.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jun 2020 09:23:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591028606; cv=pass;
        d=google.com; s=arc-20160816;
        b=FbjxxWPLQscvS0HcG7trFqx/LtihFavZA8eNl1n9TGOYQxmTurQJEeq2LewhFldZAK
         lz11LrcTIRsgn87wIJulnmfV4CjsKgPyEAIPofkGhrpGvxpzAp16XdbcB9zm0rzGTamr
         s+kK5TbpmamBEe0OReJx5USDOyL5xsdQANH/Vs44sXZLc8ozzlOy+DEUtKBqeBoPTYwb
         tWDdNM5W0nb7qUERBEKjN+bfwC5/gZlpcnGk4cq23vC12tYOsR4Sa46MuNCFCYFLLynY
         3bvghLM1IpkkGgKfmw/Cs9p3ArdXFy5IL+d/HbixXyCkfVlXyYxtvvWv5fhKAJn6KhGU
         vRrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=ixOolh0N2uUAMhpEVc4hvd2PYlHFAMniENwFlFZIl30=;
        b=GNtQBeZ85Th8Rip4Aj0Rx5yf6djiujLLewxqzRobmgnLAGy+54+NxCWasb2FNoJ7tm
         Ii95Ro/nFr4hL63eJC416kZmYghQ5/sJTx1DSd2R2PuVoJhMQRfb70ygAsNsdB8fHq1e
         XS71ao1gCcCCVstB+Z1gvFRqLYhS5Eb/vRBv7R2RM/lCxaHswilqmlaT7RcwF//kgSMG
         OavE7fCbETHypefk3qQLfpToV93zne8zD4nApBIF0JM2uXKHuOuyOvjg90amKrngevWO
         u1Iwb4h/aLrPp3/xbUBT34eXaMMmmYKugmVDpy9T0jzf3kfv43MNRaWa6TVHwPCh7JLC
         3bqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DB9lUrff;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixOolh0N2uUAMhpEVc4hvd2PYlHFAMniENwFlFZIl30=;
        b=cZyMZNMV2MUgjaO62e5WQi4RFkvI9pneFjkFSMIDqx9y5wj69fay5zQIc8ejaQ+xgF
         9qOMzairQHwD8DphX7zXZPolYbkXcCdnumLqIrXJfalHfW/6De4ZgJC7GoCtDn1wSoYJ
         OjAv2Foe6Yp3sJIN10pkDBbByC8CNi/FwFS7ivUpQNf6PrpjO0xUx5ZRuTQ7dbVI6EAP
         edYyU+Z0ewkzC0iCrzYzaQFGxB0NXcu9jUopX+NOlW3H0z+hrqTrUfQDjpOZLASYGaJM
         2+JkE8NXT73wqD9y5qu0c6/F4Au4nVU1G0a3Xm+FDZtbdW7nLPOIg0pIErbjqMg/v7B8
         Kf3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixOolh0N2uUAMhpEVc4hvd2PYlHFAMniENwFlFZIl30=;
        b=LHiqw/rGK0dedc2aFe0x3/rfgHG4BFM9RshzA5PrW/1vPv5MChdxlKjkPzHT6f+axA
         7JLZvLoD96uhkyRPWV/wzeEfNrs1MbS1s/AHdUkzYAC7gpHMw+EIF81+qQyXY8MCZRKm
         A2qC2l3SBB5bj51QvkYzloxGqjkxiWk/8z0Osd39yf7FO6y73thJfQ50B1o00PwHbWnU
         TsNrVpEwLqIWTNfXaVgYoFeV9sgyhUf8vmO1Liy+lKOGnuTAsy0Pp+JyHERhLPVT3opS
         yGzrbHfLAZDBr5alwZv+VbpWLwn4OZKGfR7LFdDEnBGseEQEkStYEPhg1sXSmufvYD9t
         YCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixOolh0N2uUAMhpEVc4hvd2PYlHFAMniENwFlFZIl30=;
        b=V6vR8xJhx6E/Bx09h9pW6SvN3++MciDRl4tCHG1IFNf2YH12FEvMb5gl5IVG8Yw7NM
         tu8YMsYH5fpRMONhLKn9ZOr06m+OjebXcKJLT7lyGA+pCXXoNRvxXKjnse1+Iis6/uGK
         RQPdynIrO8PQeUSOT/jOXeoZEk0LqsmqMY7NsVyjDSK/Dj4cwhBiMjbGnZaIpQ60INZi
         2MpCHrytsA28oxFlyiIBBSOwqZd6MlX8M0wtA4qGMcKqYE1PdmyPDIAZ/f8+vROECQJB
         AHP06m+SoWSECLn6IhVXKwluDsdgilSW2iPF9TIhnAecHyFp1rfT5TB+tHR6lNjQ9xh7
         7OxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xsC+GJEq1+baD+2IBo2/cyNmpy2beIkKDvuWf1GIhyzR7o1KZ
	8Cyeewtc6rIVcW23CV5KqmY=
X-Google-Smtp-Source: ABdhPJy7sEV1nfB0LivF12srTRD+x1+Lo5Ag9xPb3teIU+hJmbHZeT7ynO7rK2ey2hiV92jfsf/Wpw==
X-Received: by 2002:a05:6808:991:: with SMTP id a17mr117550oic.108.1591028606594;
        Mon, 01 Jun 2020 09:23:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:86a:: with SMTP id 97ls3032169oty.9.gmail; Mon, 01 Jun
 2020 09:23:26 -0700 (PDT)
X-Received: by 2002:a9d:f07:: with SMTP id 7mr8201335ott.46.1591028606028;
        Mon, 01 Jun 2020 09:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591028606; cv=none;
        d=google.com; s=arc-20160816;
        b=zEjzTZuE5AcM0VfXj4lz1Gg/jsOu7/08YtuHRRDvSoX4PR2pwimlP23lve/CyET0Gc
         X1hnKRY3Sgr0qEJxTJ9LJ+Gkyc8YUkhhQdHof9OVLz6gJK6dsnYgDtNsZOZ387fEYzhc
         v4f21E9eINHL/0EYuWSMCbuWPLwx+PVc9LxZ6gRZbWju3HKCOWV1AygobyQFx2GszgMp
         6BHP70mi6JsQvipnRhyVDQNhG0EI11HvEYDlHI+Th+GSZyZUKj7p297Bzqz6v/GcDBkQ
         xmmlxjpFO5mbs22142vcwv5Ml6xPYnVShNDtHgjrjHFnB0lb5cKLc5kbU3FGNtlFZcSk
         9J8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gLoWUfAkCTiJlaG53TMs9S6Rgdjy3LyNHB0HQGJQvpQ=;
        b=jdq4zizR4dIsJnPrY5kZNS2yb2rkHuKWxoYZQsMIVwFePpJQBiiaW6FFHiyuqCjwWY
         Fh4s3OoRUBFcytKcqJsUbEXc6YEdKV0cnzAULAnQxds6sDkbYx6ZYzfzHeiiUhiCKalA
         hPMDLS9jdxTEdEZWK0+GV6s8gQaDJM4grAzE48Mihj1e5g1SCz8wI8atpLTk3SFMZNzF
         kM6H8XSy2JxpFdvo5KReGN5GtMLb+BHZptbcLljui7XA3QaelD65C7F8XbgI253hG31k
         3q5jhU7pWkRNcbiXpa3dLGqNb0PDFac5Tmbul/mvETi0qtwMaXO0L4IavNfFdYLNYgHS
         oMLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DB9lUrff;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com. [2607:f8b0:4864:20::741])
        by gmr-mx.google.com with ESMTPS id q5si1365764oic.5.2020.06.01.09.23.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 09:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) client-ip=2607:f8b0:4864:20::741;
Received: by mail-qk1-x741.google.com with SMTP id s1so9577299qkf.9
        for <jailhouse-dev@googlegroups.com>; Mon, 01 Jun 2020 09:23:25 -0700 (PDT)
X-Received: by 2002:a37:b901:: with SMTP id j1mr12991514qkf.427.1591028605437;
 Mon, 01 Jun 2020 09:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200528144333.49268-1-mariomintel@gmail.com> <20200528144333.49268-3-mariomintel@gmail.com>
 <20200529204844.GR8737@scaer> <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
In-Reply-To: <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
From: Mario Mintel <mariomintel@gmail.com>
Date: Mon, 1 Jun 2020 18:23:43 +0200
Message-ID: <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org, 
	jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000dad30805a70836a6"
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=DB9lUrff;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2607:f8b0:4864:20::741
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000dad30805a70836a6
Content-Type: text/plain; charset="UTF-8"

Hi again,

Am Sa., 30. Mai 2020 um 19:28 Uhr schrieb Mario Mintel <
mariomintel@gmail.com>:

> Hi everyone,
>
> Am Fr., 29. Mai 2020 um 23:40 Uhr schrieb Ralf Ramsauer <
> ralf.ramsauer@oth-regensburg.de>:
>
>> Hi Yann,
>>
>> On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>> > Mario, All,
>> >
>> > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>> >> In addition to official releases of Jailhouse, allow to specify a
>> custom
>> >> Git URI + branches. This adds more flexibility for custom
>> >> configurations.
>> >
>> > The overwhelming majority of packages do not allow selecting an
>> > alternate location. Why would jailhouse be different?
>>
>> Jailhouse requires system-specific configurations. Those configurations
>> are compiled from C source files to binaries during the build process.
>> While upstream Jailhouse comes with a lot of samples for supported
>> systems, you will need a lot of fine tuning to for a specific use case.
>>
>> >
>> > Are you trying to cover for development? In that case, the usual way is
>>
>> In our case -- Yes.
>>
>> > to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE and
>> > provide such a file with definitions like;
>> >
>> >     JAILHOUSE_OVERRIDE_SRCDIR =
>> /path/to/your/local/development/tree/jailhouse
>>
>> Oh, that could maybe work. Mario, could you please check that? In case
>> this works, we can simply add those definitions to our br2-external tree.
>>
>>
>
> Yeah sure I can try that. Although I won't be able to until Monday as I
> have no
> access to my working computer as of right now.
>
> I will report back as soon as I have results.
>

It does work as proposed by Yann. I wasn't aware of that option. I guess
that makes this patch redundant.

Greetings,
Mario


>
> Greetings,
> Mario
>
>
>> Thanks
>>   Ralf
>>
>> >
>> > Regards,
>> > Yann E. MORIN.
>> >
>> >> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
>> >> ---
>> >>  package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
>> >>  package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
>> >>  2 files changed, 49 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
>> >> index 596b4951db..47523747f9 100644
>> >> --- a/package/jailhouse/Config.in
>> >> +++ b/package/jailhouse/Config.in
>> >> @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
>> >>      depends on BR2_aarch64 || BR2_x86_64
>> >>      depends on BR2_LINUX_KERNEL
>> >>      help
>> >> -      The Jailhouse partitioning Hypervisor based on Linux.
>> >> +      The Jailhouse Linux-based partitioning hypervisor.
>> >>
>> >>        https://github.com/siemens/jailhouse
>> >>
>> >>  if BR2_PACKAGE_JAILHOUSE
>> >>
>> >> +choice
>> >> +    prompt "Jailhouse Version"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> >> +    bool "Version 0.12"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +    bool "Custom Git repository"
>> >> +    help
>> >> +      This option allows Buildroot to get the Jailhouse source code
>> >> +      from a custom Git repository.
>> >> +
>> >> +endchoice
>> >> +
>> >> +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
>> >> +    string "URI of custom repository"
>> >> +    default "https://github.com/siemens/jailhouse.git"
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
>> >> +    string "Name of Git branch"
>> >> +    default "master"
>> >> +
>> >> +endif
>> >> +
>> >> +config BR2_PACKAGE_JAILHOUSE_VERSION
>> >> +    string
>> >> +    default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
>> >> +    default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
>> >> +            if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
>> >> +
>> >>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
>> >>      bool "helper scripts"
>> >>      depends on BR2_PACKAGE_PYTHON
>> >>      select BR2_PACKAGE_PYTHON_MAKO # runtime
>> >>      help
>> >> -      Python-based helpers for the Jailhouse Hypervisor.
>> >> +      Python-based helpers for the Jailhouse hypervisor.
>> >>
>> >>        https://github.com/siemens/jailhouse
>> >>
>> >> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/
>> jailhouse.mk
>> >> index 6356c5a7aa..d134b3d1b4 100644
>> >> --- a/package/jailhouse/jailhouse.mk
>> >> +++ b/package/jailhouse/jailhouse.mk
>> >> @@ -4,10 +4,23 @@
>> >>  #
>> >>
>> ################################################################################
>> >>
>> >> -JAILHOUSE_VERSION = 0.12
>> >> -JAILHOUSE_SITE = $(call
>> github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> >> +JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
>> >>  JAILHOUSE_LICENSE = GPL-2.0
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
>> >>  JAILHOUSE_LICENSE_FILES = COPYING
>> >> +endif
>> >> +
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
>> >> +JAILHOUSE_SITE = $(call
>> qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
>> >> +JAILHOUSE_SITE_METHOD = git
>> >> +else
>> >> +JAILHOUSE_SITE = $(call
>> github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> >> +endif
>> >> +
>> >> +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
>> >> +BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
>> >> +endif
>> >> +
>> >>  JAILHOUSE_DEPENDENCIES = \
>> >>      linux
>> >>
>> >> --
>> >> 2.26.1
>> >>
>> >> _______________________________________________
>> >> buildroot mailing list
>> >> buildroot@busybox.net
>> >> http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAH3JsOrGo0k4S%3DVKfaXFbgkOv2jYvCB6nff0f%2BTihKz-1ok4JQ%40mail.gmail.com.

--000000000000dad30805a70836a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi again,<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Am Sa., 30. Mai 2020 um 19:28=C2=A0Uhr s=
chrieb Mario Mintel &lt;<a href=3D"mailto:mariomintel@gmail.com">mariominte=
l@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div>Hi everyone,<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 29. Mai 2020 um 23:40=C2=
=A0Uhr schrieb Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regens=
burg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yann,<br>
<br>
On 5/29/20 10:48 PM, Yann E. MORIN wrote:<br>
&gt; Mario, All,<br>
&gt; <br>
&gt; On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:<br>
&gt;&gt; In addition to official releases of Jailhouse, allow to specify a =
custom<br>
&gt;&gt; Git URI + branches. This adds more flexibility for custom<br>
&gt;&gt; configurations.<br>
&gt; <br>
&gt; The overwhelming majority of packages do not allow selecting an<br>
&gt; alternate location. Why would jailhouse be different?<br>
<br>
Jailhouse requires system-specific configurations. Those configurations<br>
are compiled from C source files to binaries during the build process.<br>
While upstream Jailhouse comes with a lot of samples for supported<br>
systems, you will need a lot of fine tuning to for a specific use case.<br>
<br>
&gt; <br>
&gt; Are you trying to cover for development? In that case, the usual way i=
s<br>
<br>
In our case -- Yes.<br>
<br>
&gt; to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE an=
d<br>
&gt; provide such a file with definitions like;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0JAILHOUSE_OVERRIDE_SRCDIR =3D /path/to/your/local/d=
evelopment/tree/jailhouse<br>
<br>
Oh, that could maybe work. Mario, could you please check that? In case<br>
this works, we can simply add those definitions to our br2-external tree.<b=
r>
<br></blockquote><div><br></div><div><br>Yeah sure I can try that. Although=
 I won&#39;t be able to until Monday as I have no<br>access to my working c=
omputer as of right now.<br><br>I will report back as soon as I have result=
s.</div></div></div></blockquote><div><br></div><div>It does work as propos=
ed by Yann. I wasn&#39;t aware of that option. I guess that makes this patc=
h redundant.<br></div><div><br></div><div>Greetings,</div><div>Mario<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Greetings,</div>=
<div>Mario<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
Thanks<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Yann E. MORIN.<br>
&gt; <br>
&gt;&gt; Signed-off-by: Mario Mintel &lt;<a href=3D"mailto:mariomintel@gmai=
l.com" target=3D"_blank">mariomintel@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 package/jailhouse/Config.in=C2=A0 =C2=A0 | 36 ++++++++++++++=
++++++++++++++++++--<br>
&gt;&gt;=C2=A0 package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a> | 17 ++++++++++++++--<br>
&gt;&gt;=C2=A0 2 files changed, 49 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/package/jailhouse/Config.in b/package/jailhouse/Confi=
g.in<br>
&gt;&gt; index 596b4951db..47523747f9 100644<br>
&gt;&gt; --- a/package/jailhouse/Config.in<br>
&gt;&gt; +++ b/package/jailhouse/Config.in<br>
&gt;&gt; @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_aarch64 || BR2_x86_64<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_LINUX_KERNEL<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 The Jailhouse partitioning Hypervisor based =
on Linux.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 The Jailhouse Linux-based partitioning hyper=
visor.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/siemens/j=
ailhouse" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/j=
ailhouse</a><br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 if BR2_PACKAGE_JAILHOUSE<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +choice<br>
&gt;&gt; +=C2=A0 =C2=A0 prompt &quot;Jailhouse Version&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 bool &quot;Version 0.12&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT<br>
&gt;&gt; +=C2=A0 =C2=A0 bool &quot;Custom Git repository&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 help<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 This option allows Buildroot to get the Jail=
house source code<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 from a custom Git repository.<br>
&gt;&gt; +<br>
&gt;&gt; +endchoice<br>
&gt;&gt; +<br>
&gt;&gt; +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI<br>
&gt;&gt; +=C2=A0 =C2=A0 string &quot;URI of custom repository&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;<a href=3D"https://github.com/siemens=
/jailhouse.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/sie=
mens/jailhouse.git</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH<br>
&gt;&gt; +=C2=A0 =C2=A0 string &quot;Name of Git branch&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;master&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_JAILHOUSE_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 string<br>
&gt;&gt; +=C2=A0 =C2=A0 default &quot;0.12&quot; if BR2_PACKAGE_JAILHOUSE_L=
ATEST_VERSION<br>
&gt;&gt; +=C2=A0 =C2=A0 default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if BR2_PACKAGE_JAILHOUS=
E_CUSTOM_GIT<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool &quot;helper scripts&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PYTHON<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_MAKO # runtime<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 Python-based helpers for the Jailhouse Hyper=
visor.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 Python-based helpers for the Jailhouse hyper=
visor.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/siemens/j=
ailhouse" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/j=
ailhouse</a><br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; diff --git a/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=
=3D"noreferrer" target=3D"_blank">jailhouse.mk</a> b/package/jailhouse/<a h=
ref=3D"http://jailhouse.mk" rel=3D"noreferrer" target=3D"_blank">jailhouse.=
mk</a><br>
&gt;&gt; index 6356c5a7aa..d134b3d1b4 100644<br>
&gt;&gt; --- a/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a><br>
&gt;&gt; +++ b/package/jailhouse/<a href=3D"http://jailhouse.mk" rel=3D"nor=
eferrer" target=3D"_blank">jailhouse.mk</a><br>
&gt;&gt; @@ -4,10 +4,23 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;=C2=A0 ############################################################=
####################<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -JAILHOUSE_VERSION =3D 0.12<br>
&gt;&gt; -JAILHOUSE_SITE =3D $(call github,siemens,jailhouse,v$(JAILHOUSE_V=
ERSION))<br>
&gt;&gt; +JAILHOUSE_VERSION =3D $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSI=
ON))<br>
&gt;&gt;=C2=A0 JAILHOUSE_LICENSE =3D GPL-2.0<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)<br>
&gt;&gt;=C2=A0 JAILHOUSE_LICENSE_FILES =3D COPYING<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)<br>
&gt;&gt; +JAILHOUSE_SITE =3D $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_G=
IT_URI))<br>
&gt;&gt; +JAILHOUSE_SITE_METHOD =3D git<br>
&gt;&gt; +else<br>
&gt;&gt; +JAILHOUSE_SITE =3D $(call github,siemens,jailhouse,v$(JAILHOUSE_V=
ERSION))<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT)=
,y)<br>
&gt;&gt; +BR_NO_CHECK_HASH_FOR +=3D $(JAILHOUSE_SOURCE)<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 JAILHOUSE_DEPENDENCIES =3D \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 linux<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -- <br>
&gt;&gt; 2.26.1<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildro=
ot@busybox.net</a><br>
&gt;&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" re=
l=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinf=
o/buildroot</a><br>
&gt;=C2=A0 <br></blockquote></div></div>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAH3JsOrGo0k4S%3DVKfaXFbgkOv2jYvCB6nff0f%2BTihKz-1=
ok4JQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAH3JsOrGo0k4S%3DVKfaXFbgkOv2jYvCB6nff0=
f%2BTihKz-1ok4JQ%40mail.gmail.com</a>.<br />

--000000000000dad30805a70836a6--
