Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWF2T7XAKGQECQKKZJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1CF6842
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 10:50:16 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id f16sf5248079wmb.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Nov 2019 01:50:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573379416; cv=pass;
        d=google.com; s=arc-20160816;
        b=uhGGjDsbIVuthpCo4YkIyFJUNu8TkSoA0C/9SAHYD9xBlOQel1ejaRLJSrQ57aRb3a
         /rK+djzl581vRQ6tF9eDC4Ph4SgEufd+X+p1lPlafC1YCBHVsoVnCT8HeGnhavR9PefQ
         MVE36cxZlMov2enJCzjxhlqe5TCb2khViI1R4FCAKCYTv+XCU2gnElXyUSETL4CaeZxw
         zR0y5ob2qWP9WnMmd1Sy2Dl+JQ23MwMFx/Vkf43CfiXXublWNQK1jqNWTA4XoiyRlhGu
         FBD7Iqk1qAOw7y3IGKqY3Y4flEc/5CKlkjBBuf73jkU7EJ+1GD4Wi6EK2ztB5a9aCC3q
         Fhmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=rqaIyXsrqMnYpyB4sUQikWakBb/I9m9mCFLnk/d/y/g=;
        b=pKuvvNeFx2EjhCxecTNi2DZA03w0X2feD9Dn9x74vQfF7qmO349nrPIUDcHTkAVKr1
         nIBk5OybTS5LiRudvrVwBKF4uNYsQ1SQIAvSnQuH7Y1l4HX+btqTgxxtojHLymAVpe1+
         q1Hx6h/cMXpATJB9rFd9tbY+ewWTep3WllahupyfMqrnWsyfij0NH2uRpjfJezk9BiJ7
         FqqjEfc0Eg1wR0XR7hk0NEmc4Q4f5kK1YYFoqszDjUoVfb7FpG1IWTwc+ha0MQLbST8o
         gwHBLVFlOFqf8v2fXDa2wMtjiZX9o5VMaPYXl3l22z7PP/xTNup84fBkB12BDPJI4UIe
         eVVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="YpkKkV/S";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rqaIyXsrqMnYpyB4sUQikWakBb/I9m9mCFLnk/d/y/g=;
        b=YMFmsh7KM8wvELc70Bv/G3No1m4h5WFMWepXq2DPJ4PuUPSWU26qnw0UBHB1dSUyZi
         yMCeteItQEAhIX1dHR/+HS04sJsHK8hIKIHK7KFRRicEbI0/pcFCoW8uA/wE342JiPht
         yrtRwzANhsOa3eB7BwXTg+JLgryOs6Wi1ZYSGdWR3YrBQ72gNYJdRDeir6rPYk1haJ5h
         jJ0cdR/zGzb2p3Gwp7gw2eayC13iCxrmD09/LMSwNY7cMS8hwe7KQezY/th5Z731k95n
         s4fN5SqcPsW9sJQzTPmeohMphS9DdMt1uf0pq69TXrv5EVAnoCxdCid2FfCEHd+N4lWv
         ka/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rqaIyXsrqMnYpyB4sUQikWakBb/I9m9mCFLnk/d/y/g=;
        b=p6pQ3UJbxTlwWMeYYpVA8MnxuRj2IycusSHz+9hUERH34EFoLD+P6OvPwBJocR//Wk
         rsY6yuhJDBx4/IfHdaX7O+aURN/XSdHt6U4My1ahAOLvXE85thRYw1qBtqng851w/WRD
         rMQl2ZTcqWXn0u2mFuyB5SDGBgfTTdH7GifFIpKi/YKY5cMwl0MStsNNULsPNVhVEoUA
         Ev5RSzqj7zFUJHeK5HVY2kRRyY7uqoLN1quaxEA7pDlqmfmSK8SCvdi33ZacDhnU2vgF
         1yRcSEPLQRn0b1+QAoP3vv7lZ1tbMSzsZTKYa5LmizxPIwvSDAsEKG1ZyU98QGtGfRiU
         Pl1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX38OxcD/caMinOU5a+q8ifuVbJBgLBuPodagUIdDudpR1C4LWQ
	lJvitY0QSz9fGof3W9+X7VU=
X-Google-Smtp-Source: APXvYqznknJs7y2JOt3sOLrsfRMCcKKny6Dpgs+vPpbpuMfvxA2epV0+D7kow5aboQhYPqYhnVgcwg==
X-Received: by 2002:adf:f10d:: with SMTP id r13mr1854497wro.173.1573379416430;
        Sun, 10 Nov 2019 01:50:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9d8b:: with SMTP id p11ls14932215wre.7.gmail; Sun, 10
 Nov 2019 01:50:15 -0800 (PST)
X-Received: by 2002:adf:91e1:: with SMTP id 88mr17239269wri.16.1573379415838;
        Sun, 10 Nov 2019 01:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573379415; cv=none;
        d=google.com; s=arc-20160816;
        b=AgjWqYLyDXYApRO9bEbKdJmOOTTv8EhVQ2UWJr6A7QUaKlCOcZ881SzWb7J6/1jbfc
         MhDN0Nmrzkv+MPGTfCxZhBP1olr1KX54ERwYAFC3ngGv314AVP3uBmmduJU1ZTyemlu6
         BC/tHLal/yBder4x3ksyCLDkvLnxP4H9xjIyjO+rtVwjMz9LhgcW8epZi0iE75qscsX/
         maulCsO5yyrXKuqP0yv3XMs0ZYC5W5y9C9bBDGmiYVFSA5qMyHBA48MVfStfq6AYazC0
         V0uwWA8hoGzNCFN0X5zr5tl3ryEbiwnwNq+8tqL9HzqG8d2EaUg5S4EXQvpQqfIb5z6c
         YRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=4gKl5J48mXMUV6cdSlp0tKaKaO+HTwwozSFjuRzKCYA=;
        b=YlXjKH4axtA1tPB9Em7fmFIRMir9OJRx+kSZhS5WjPHUJ18mBCMFPXLXFkhpLusQfx
         CWptoTOSGMr2ZYduI2MeUkAHtPj9uDJYjnh/CYss7RYog9d93fpT7QXPWDlAuN4fCNCT
         w089hTBJ647wjmIggTTRaUawYY61nbMMie2x73bT/2L4EOFwEZPjyvco3qkAfDDIuFK/
         M5I/rYpEJOWyd7Tx3Gy5gQlbjNdg5h3bgpLFBr1/eFiq8/idAm7yI9GGqOKHGNt6UMso
         6Ww2xJr1zHN3pZ2UMW2yT6L/qI9AZ2T+m55T+UQc1IpkDtbA45zOXzSI1jGOx54t/Ywg
         vzDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="YpkKkV/S";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id i15si875764wrv.0.2019.11.10.01.50.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 01:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LwlY0-1hs8yd0HJQ-016Kf9; Sun, 10
 Nov 2019 10:50:15 +0100
Subject: Re: [PATCH] tools/Makefile: fix install of jailhouse-config-collect
From: Jan Kiszka <jan.kiszka@web.de>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <20191109223045.26043-1-fontaine.fabrice@gmail.com>
 <80c93e40-9dc8-35eb-123e-62c688338dee@web.de>
Message-ID: <5d247d71-d2e4-0d98-e02f-1111d6de1ac0@web.de>
Date: Sun, 10 Nov 2019 10:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <80c93e40-9dc8-35eb-123e-62c688338dee@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hCtWUaSeqOSKNKSE6Wk/kEnwyABHsBjQqsBK25YvP8oYP+k0VKc
 fOC7lgVHnuEK96NTVsHaWcpdpc9uqHZICgF95hdS8OAUL6sC9PCjyDIiBOliRzn000P8Ppo
 XA1jAvAfcIqUQNuEacV14fdYpS1nRRXegn4dk7IWWUzkVbYftPCtLY+lW7A+bEnVq92G6Gg
 D04eS7a6YqCpq3kH8uAvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8TQJXUykyU=:HC9A56crLqKP7k+ZlgXPBF
 QGKFtn2HPXlIjvTeFIL6kVrpdvzCP+gFg//Lv4JroTQxgoDWo7UMqpCXf+mGji5afa017D0id
 yMOwLMmcgOxP53v/dxaCiblOma9tXs02p3Pa8xHhYb0kj0b/JAQTKfpqzjw5XCnAhSz2Sbq+8
 So8hd78Xah260blH2xaf8lU2c9S70NrOIqX+Y6KPjW3eHCa4u0q0/6IT5XHqj3u8Zwioydfss
 +3a6aLZM3cie26lt7xws3gyKFYfG/stDUw4U6FXZySzEEV1yNrBRpRAtnxITGsiv5MS/H1oyc
 9YYH+W+Y4Zh40vmtUsHoIshWP5zIL+Kt0a6xWmpNAgDDLFIHfx+I3pbv2bNIlpHvYBOnnH8XU
 Dl5FLCq6vsrEjvhtCIThC3UKK3dHr70yHCYpO8cjjbIB6SoniX+i2I7NUNTMDLMdHOWPec5i9
 hzmoCQEy/zl7yQt0PzkMBwkkDxCbRJG2vcDl39QVbwNsAV7O/MDFGE5HBhwpfMpJV240N4nn0
 7rxH1YKmHZ10BWc4qsaxFr2Ty8Q8UTNDLM2+4Qgn8y8OUFvYQzpOyysMChUEFpbBCiptXlPXp
 kAG5/THG2q69RKAs4aXP0lRzleNMsVFM2MkQZ2/MO4mINqvmbwWrDjA+3bZTqN7gCXtP+Rcwk
 Lftzg3OVFQlIl9sBGq4T0+WkxAwD6Gc2uv4UDeMQKOkGA/aO14jB7eqiHy23t7hZMgxgBryWa
 tTEyGi94gHN1cyUf7tgn67wfFA3lrPVUV406ii7DU0vTAi/2BeSKA4omIYBHO3Ft+ZWE++VpT
 8N1IXuU0AB2m2jydg9n4m5t1hAT1sSBRDrb33ZTe7mRhimpCF5AZvE/VIPjSCX5y3oHb+JlE7
 rFYjKeK8JZnTVRHvNyur2BzFi+jrEpwjQcmDIeklvRMPjanyk3xM+rM2yroaN7FuC1Xx1lLxG
 1u+6RCw8ZoCP85gu3KeEaCS/wSSMIL7SiKVgFyYcPXM7j1tH2xlwQt5w5ZSOvAN4XrwyuJ4Sq
 b0fokN+1iLs44Z/xhRkLBjWBApI1fPh9n/UfBtA5AsmOfOjBEy+9fPxR8j2inEwOjP4Vdzt6y
 x4p9PVFqNUqHpPnBvTNK5aJ1on3i3+qbiZNHIacyofz2gXBx3P/ohIeuLVSWdSzsCbNHANqnI
 ClKRnNQ6pkXsJaFANkxUe8nqjxHwdvRmOC1nSWep4AWOwuMRsVKIChl9qWXsnxgs4ZINuw2Lc
 pgzZl7RozPDxGQ6I/Y7e2T9U4j623nTNoqiiH4uANaXkKVwQ4WqKciEGXztI=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="YpkKkV/S";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 10.11.19 10:46, Jan Kiszka wrote:
> On 09.11.19 23:30, Fabrice Fontaine wrote:
>> Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
>> jailhouse-config-collect is not installed anymore on target as HELPERS
>> is updated after install-libexec target so fix this mistake
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>> =C2=A0 tools/Makefile | 34 +++++++++++++++++-----------------
>> =C2=A0 1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/tools/Makefile b/tools/Makefile
>> index c7dbc734..7f4d00ff 100644
>> --- a/tools/Makefile
>> +++ b/tools/Makefile
>> @@ -35,8 +35,24 @@ KBUILD_CFLAGS +=3D $(call cc-option, -no-pie)
>> =C2=A0 BINARIES :=3D jailhouse
>> =C2=A0 always :=3D $(BINARIES)
>> +HAS_PYTHON_MAKO :=3D \
>> +=C2=A0=C2=A0=C2=A0 $(shell $(PYTHON) -c "from mako.template import Temp=
late"
>> 2>/dev/null \
>> +=C2=A0=C2=A0=C2=A0 && echo yes)
>> +
>> +ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
>> +always +=3D jailhouse-config-collect
>> +HELPERS :=3D jailhouse-config-collect
>> +
>> +else=C2=A0 # !HAS_PYTHON_MAKO
>> +
>> +$(info WARNING: Could not create the helper script to generate \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configurations on remote machines =
\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("jailhouse-conf-collect"). You ne=
ed Python and the \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mako library for it.)
>> +endif # !HAS_PYTHON_MAKO
>> +
>> =C2=A0 ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
>> -HELPERS :=3D \
>> +HELPERS +=3D \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse-cell-linux \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse-cell-stats \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jailhouse-config-create \
>> @@ -62,22 +78,6 @@ install::
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Python and pip in order to install them.)
>> =C2=A0 endif # !PYTHON_PIP_USABLE
>> -HAS_PYTHON_MAKO :=3D \
>> -=C2=A0=C2=A0=C2=A0 $(shell $(PYTHON) -c "from mako.template import Temp=
late"
>> 2>/dev/null \
>> -=C2=A0=C2=A0=C2=A0 && echo yes)
>> -
>> -ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
>> -always +=3D jailhouse-config-collect
>> -HELPERS +=3D jailhouse-config-collect
>> -
>> -else=C2=A0 # !HAS_PYTHON_MAKO
>> -
>> -$(info WARNING: Could not create the helper script to generate \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configurations on remote machines =
\
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("jailhouse-conf-collect"). You ne=
ed Python and the \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mako library for it.)
>> -endif # !HAS_PYTHON_MAKO
>> -
>> =C2=A0 MAN8_PAGES :=3D jailhouse.8 jailhouse-cell.8 jailhouse-enable.8
>> =C2=A0 define patch_dirvar
>>
>
> Good catch. I'm adding a "Fixes:" tag on merge.
>

...and I'm adding initialization of HELPERS in the !HAS_PYTHON_MAKO case.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5d247d71-d2e4-0d98-e02f-1111d6de1ac0%40web.de.
