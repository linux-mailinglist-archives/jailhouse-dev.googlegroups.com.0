Return-Path: <jailhouse-dev+bncBC653PXTYYERBYMRR6EQMGQEW4T75XQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 299BE3F4E0F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 18:12:18 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id bo13-20020a05621414adb029035561c68664sf12717193qvb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 09:12:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629735137; cv=pass;
        d=google.com; s=arc-20160816;
        b=aFPpsJiS9pTP2VzroA/VHKFjWj3F0j6AMUzptH1m4rIDadLBnuja/dA8QaYJsr06Il
         Rq040wUjr1GyTMVaMxmfg2vx+HR7A6EZDhKfulBQl36CMv9kq0AqNApbkb9hGcCbQlEO
         mSFVtwpofvuvtFtWHy2QhO3L3h61jHMR8hNKNzHi3TfOtrOrA6lDHD+Axz+vMYMMeCMQ
         NZMUexj/bDUd913eVb/EzIat5g0s6NPImgYFdMJJJp3HNd4pBYZF3YUxzz959jjXmJ0p
         IGUg90ft6igC2QBPJLKulU8JIGJ36y8zWyaZnUvvY2QdQXXH0Nn7cLe5a6lib+V0eFlr
         +aNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=tPrMY0WwPjwUXGUX0UMwF4r/zCc0OXZNrO0QGH4MjB8=;
        b=tXshgiIUoMgnHlxwqj9NOw3n/yQFkwkXZb6tlr5a3DtapHYjjCdTmQobDkyE3iY42d
         Tr9vphghXSelzs3F1PJMpuOiU+buEA6C5FwwB5Rg2OpNzi6tX15naAjkXI8pPB3VxIVM
         2cE1A0ij1R46BDMTE+0jzYekq1D1gxj04vctNPyszOGTKDkmnfDJitwLZDRowbe673Zj
         5MDDkZJS7KRhOyJP3vJS/2lCUwPbixT6inSb/DFKj9z+fBQMjvP9OnY3CDlPAfD92vBG
         pdj2MLCQFAGyl/GtkHTHvEasEUHMXB0ke7n4+qZAlB0jQAVqsT/y8c7OtCJqvIoNK7B4
         Lu6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IstGD6wT;
       spf=pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tPrMY0WwPjwUXGUX0UMwF4r/zCc0OXZNrO0QGH4MjB8=;
        b=SAVm0+zDaqFhnA3kic8s5ZrSpc/hj8k1oFuQWmNxttteJJqmAD0M/KttBcMaKCUIcZ
         bOgFjc32Y5pxK8capq29k7yyAbuZC6ysyRA3LB6shtoj8vr81vHgGyIM5K+esS/3Hq0d
         VhiuG+h0GvGByGkQOELPY6TvxJCF8nVDLU2kuOVfkKVAnYeH+lUy74BD84uFsryRuDOE
         UJrRcOdTBFa+cVbjIlZ3xkO8MLpvuFACbETdh13bjCeektwZmE2DoDtmAWty2Dq0FrBn
         DlgFRWAUSgeWksm27AOFhZ231aY+rcAskwHELYxvMFGlqIMoeOtMlQfzyaEIs0YUxvtf
         2aEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tPrMY0WwPjwUXGUX0UMwF4r/zCc0OXZNrO0QGH4MjB8=;
        b=K1jSyLG7EBn50T65fiNjIc4pU1coSMRhz5kRzwhXyZpjX9USoO8SkNWjWB+R9+ZgDS
         +luQP4U+sPTyNls4VhP25zBtomF0ihxn7+qQcphNNn0L7uI4NqDKpvhMagtYpI2VN88z
         hf98GfKi9TQc9Ro8f6A+vwoQ+NIub+k7O5Eh8vqnjm/uEN136nd7wFK5kNSlX9q++Z/c
         mRC1uQtZIwLzsz6ySdm8CNxeffxkhTq2sUcdSwE7Lrf9EVZnjv9HO4s7dvC/7ui9Xvpl
         4FLt3kUk19VgoiB5PYWrYpujKg2xJxqwqDLF3sffuMBUGl83J95pQ4Z2eTlj5rtTFWop
         Ktfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tPrMY0WwPjwUXGUX0UMwF4r/zCc0OXZNrO0QGH4MjB8=;
        b=cqa/F3IU7FDQHptE+lF1d2ADX9zzWlZ86HmavW4MVMvQFqKMEEv8ycNqjRImSBN7Is
         tMw8OXmYdQxHY4MeHxndIg7mtkT19dXWUQh01D5FljB2QOAZoc6sbBhVBB+ZtmauC/1a
         3hBLcqV1R3vdgWIUdVqR/jaOkCaWfA26z0oZ6dhxmfnImT7BrnWnKWHmqMjN6zyuN6Zq
         zhMsTTeyjBxVKdl8ntXwH32acU6BRbx2bkoMrHG1daWO8s+TldKhMYehpKF/ku/rcxpN
         qosh3ggtCPvtd1yqv7eDqe/YW1mMaCcgX+BP3iOJXVqjntDgKONsNyMiOCPjwBgHCS5B
         ydWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532IizE9KF5DdmcIwjLOYDz/faI+IQQNTAJrFgDWWdORWgXv0Mde
	BswUfqXyol6H0w/oEC5iwb0=
X-Google-Smtp-Source: ABdhPJxHrsRcb4t/hfHgDNbxyK7fMvS8OPhDHdeBbwvcJO+L6Ujsj1ZsIUoGDqkQzV8jOyhnZFWLqg==
X-Received: by 2002:a37:a20f:: with SMTP id l15mr21484136qke.24.1629735137226;
        Mon, 23 Aug 2021 09:12:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4006:: with SMTP id h6ls2188276qko.11.gmail; Mon,
 23 Aug 2021 09:12:16 -0700 (PDT)
X-Received: by 2002:a05:620a:897:: with SMTP id b23mr21926172qka.34.1629735136668;
        Mon, 23 Aug 2021 09:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629735136; cv=none;
        d=google.com; s=arc-20160816;
        b=v7Bxm5QVcSOyitVirm0tnKkiI6amGBgOY7C+SenQlc1S+/SvulqhSVzgt3hl2aKjY1
         AWAawhdA1ks+QEVHyD/ENClWmamAVhWm36AAljHhhTjBxDobWerxrhPc4teLFDGCA6Gc
         pFa95Hi1LzPKw50PPcWYGD2X2gQlBYX1zrVYNQy5YQsp8THKEbma0DkmPJBDW6ahJAjx
         Ni3XB5NqxJftW6CezgPUC71+7KmJO8zqrx0W7dHJMgP8h+E0LluXww4Nh9fOmJ6WOQ++
         08FDXIvusMzxjRmhKDPOppwvsjNhAhgU67x0U9gd6H1MHuzHCD6UWFhMqNgoipVOaQpN
         C0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ylh8wxvb3DlidJ2+K/PslS/kQJqIlpwY6glTTYyFiDU=;
        b=1DxQOwQuFpH2n0cHLG9XPzrKk0e2JrcGZOijEHIbrjmPAL4zBi8L4Mo+hhTGeV1pkm
         uP4hb+dFCyNws7Tho2u07KmpujaM7VSbsL0zJTF99xXwENr4j6fF/vbNH3VYdoSZGXH+
         GXsoCL9EMG0e6ziV20F6Ul74DsjNC5JSfcgJehK+7hALzUDbKE9KBlOgFG416vNIReap
         GVc42M6ZTqRnxMk2bh2ToIam6txpQWRqHQLSv4VFyA99a0jra7YUGSHyUEtbw6DxldpE
         TYd74TDghimsvF6zUq1MoE6rT2kaeJ11tAS2ygM2US8j4J4Odscdz5He978HLBr5Pfs8
         FImg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IstGD6wT;
       spf=pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com. [2607:f8b0:4864:20::c34])
        by gmr-mx.google.com with ESMTPS id s29si726344qtc.5.2021.08.23.09.12.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::c34 as permitted sender) client-ip=2607:f8b0:4864:20::c34;
Received: by mail-oo1-xc34.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso5568933ooi.3
        for <jailhouse-dev@googlegroups.com>; Mon, 23 Aug 2021 09:12:16 -0700 (PDT)
X-Received: by 2002:a4a:e381:: with SMTP id l1mr12026505oov.48.1629735136123;
 Mon, 23 Aug 2021 09:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de> <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de> <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
 <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de> <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
 <6c3b1b62-84fc-fc39-1115-8f695897e712@oth-regensburg.de>
In-Reply-To: <6c3b1b62-84fc-fc39-1115-8f695897e712@oth-regensburg.de>
From: Moustafa Nofal <mustafa13e09940@gmail.com>
Date: Mon, 23 Aug 2021 18:12:05 +0200
Message-ID: <CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9=ipg@mail.gmail.com>
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000ddde8605ca3c47fc"
X-Original-Sender: mustafa13e09940@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=IstGD6wT;       spf=pass
 (google.com: domain of mustafa13e09940@gmail.com designates
 2607:f8b0:4864:20::c34 as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000ddde8605ca3c47fc
Content-Type: text/plain; charset="UTF-8"

>Did you assign those two CPUs to the cell? It looks like someone
>else would access those register (ie, the root cell?)
No, I am using only one cpu, but maybe its just conflicting with another
peripheral.
0xfe201000 is UART0_DATA_REG.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9%3Dipg%40mail.gmail.com.

--000000000000ddde8605ca3c47fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Did you assign those two CPUs to the cell? It looks li=
ke someone<br>&gt;else would access those register (ie, the root cell?)<br>=
No, I am using only one cpu, but maybe its just conflicting with another pe=
ripheral.<br>0xfe201000 is UART0_DATA_REG.<br><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9%3D=
ipg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur=
52j7m9%3Dipg%40mail.gmail.com</a>.<br />

--000000000000ddde8605ca3c47fc--
