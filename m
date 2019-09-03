Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBMPCXDVQKGQETHJ26JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E685A6510
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 11:24:03 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id 71sf10268744otl.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6yII6ESuBZr04c5Th04QzoYgeiSAv3M09W5NLPJs5DM=;
        b=FEnSqSiXx2Ftviza8fGEn2kvZJO8rI5uWDlwDk3zqzhwqqlrgGt1Q6jNXZkgodf47g
         yGQjQ5jnbnBfBq2wBn4VF3wT4CuovMGEltQBrCb3ts8H5MivTUbQtCB6thmptLSLA4is
         eLxpcC5Ba63tyB4jiHl6u0Y1HqbtswPkmac2OaNAnTocvrmQN+VRT6kUzA1YQlzcw7Ov
         mhFaHgCiorCm5rcJjDoKlv5LmJHIGp/hyYk0Su+Q3mQhIQlz8b7TQMqzvpCIAHcuykrO
         dJbtXOmQKR/Y6WUkr+Y9sWRVDicyGGeDj2zPUKTsEk0iOJOlnaoI2izPRU3FwgaxfN1n
         EzuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6yII6ESuBZr04c5Th04QzoYgeiSAv3M09W5NLPJs5DM=;
        b=NVSfRpZl9PCp4VEbJGTMyYle02BXxajB6QyDmlCCCcwVsEZRVAsAEQ7GLNzoVKjf9G
         KcIwWHrP1nNmJBmn4jwVLrvJVelJ+XXITsFy5NSv4k+AJX55cRMBGdaL0EBU09l9+rw3
         ucVxs83H/3u2CZ8MuQcq0QXjaGuKmp9EYtWjSSNDaqHecy2Nmf6FEJVMA0mhGOAYXp8y
         LdHmg4idLXMSbrypTfDSWnSDLf+4DAWJZYgXvAnqNiL594SB4yTe17LVm/S+qHFGVa58
         whGBWwcTOq56N4wHSS+Z1X02Szq182BXidUCLdeqWNrVzh8MCiWZAt2aSTsYfTMRDbBN
         XHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6yII6ESuBZr04c5Th04QzoYgeiSAv3M09W5NLPJs5DM=;
        b=t3HgCNH9Uy20Pm9CHqFoZpOCToz2gIvqneoKhHVuqK3DMY1phkrDUas5PHVg68URLc
         Bkv26GNlTStMgzDBc+acF/UIKeJ62r9jGzG1KRH9trfzAbcoCpFo0gnwqhw1MwcBq0u8
         BQdtY3efWSbEcHx2ZfrPG0IUw52amFmJskHU1Wsh1F5H/w5kPPdTeLdRRcKdaeI7EYIL
         xDzOL/Hrx2tOhuF4IUA2P07aSoO0765RyRW4bRoXIrVTbHP6hnkQN1ikh1UiFKbQXYAC
         +vAGDQAOJq+MKxKoFJYl/Bdt6C//byG88OVaK2CxADXUIiOIpgvq/XweltjHVoHPqut6
         DW5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2CvY+s2NIAz62MsTphy424I6qSfJTaZbmGL0l7tuZt6xygBmk
	keIde3coYyqzwD9sxplZk8E=
X-Google-Smtp-Source: APXvYqwrzBmAAaUpJibIT7rigvXE1hkkZtRb0eOXRq8oUGIMdeZ8fioqMlb+2cciTVoefewVyvK/jw==
X-Received: by 2002:a05:6830:1345:: with SMTP id r5mr16627348otq.158.1567502642004;
        Tue, 03 Sep 2019 02:24:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:2207:: with SMTP id b7ls1643227oic.5.gmail; Tue, 03 Sep
 2019 02:24:01 -0700 (PDT)
X-Received: by 2002:aca:5957:: with SMTP id n84mr1509471oib.174.1567502641127;
        Tue, 03 Sep 2019 02:24:01 -0700 (PDT)
Date: Tue, 3 Sep 2019 02:24:00 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69047717-186b-4e56-b8af-50294e493caf@googlegroups.com>
In-Reply-To: <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
 <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
 <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
 <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
 <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
Subject: Re: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1184_417566359.1567502640420"
X-Original-Sender: nirgeller18@gmail.com
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

------=_Part_1184_417566359.1567502640420
Content-Type: multipart/alternative; 
	boundary="----=_Part_1185_1152859008.1567502640421"

------=_Part_1185_1152859008.1567502640421
Content-Type: text/plain; charset="UTF-8"

Hi Ralf,

I get a spike on jitter when executing consecutive "cat somefile".
The spike happens when opening a file on the storage device, when opening a 
file on a tmpfs,
when opening a file on procfs and even when executing "cat" on a file that 
doesn't exist at all.

The root and inmate cells do not share resources and the debug consoles are 
directed to different UARTs.
u-boot, Linux serial console and the hypervisor debug console are on UART1, 
and the inmate is on UART10.

Thanks,

Nir.

On Monday, September 2, 2019 at 6:27:50 PM UTC+3, Ralf Ramsauer wrote:
>
> Hi, 
>
> On 9/2/19 5:11 PM, Nir Geller wrote: 
> > CPUFREQ is set to performance, and I'm setting scaling_min_freq to the 
> > highest available frequency (1500000) 
> > CPU idling is disabled 
> > 
> > Now I see that executing a simple "cat somefile" on the command line 
> > causes a spike in jitter 
>
> only for the first time or also for consecutive calls on the same file? 
> IOW, can you observe/trigger the spike when somefile is in your page 
> cache? 
>
> Does the non-root cell share any devices with the root cell? (e.g. debug 
> UART) 
>
>   Ralf 
>
> > 
> > On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild wrote: 
> > 
> >     Am Mon, 2 Sep 2019 06:12:00 -0700 
> >     schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
> > 
> >     > I created a kernel module that catches/releases a spinlock and 
> >     > disables/enables preemption, and it had no observable effect on 
> the 
> >     > jitter, however, 
> >     > the operations insmod and rmmod definitely cause spikes in jitter. 
> >     > 
> >     > Any pointers? 
> > 
> >     Do you have any power management features enabled in that Linux? 
> > 
> >     Henning 
> > 
> >     > Thanks. 
> >     > 
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> > Groups "Jailhouse" group. 
> > To unsubscribe from this group and stop receiving emails from it, send 
> > an email to jailho...@googlegroups.com <javascript:> 
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>. 
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com 
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69047717-186b-4e56-b8af-50294e493caf%40googlegroups.com.

------=_Part_1185_1152859008.1567502640421
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ralf,<div><br></div><div>I get a spike on jitter when e=
xecuting consecutive &quot;cat somefile&quot;.</div><div>The spike happens =
when opening a file on the storage device, when opening a file on a tmpfs,<=
/div><div>when opening a file on procfs and even when executing &quot;cat&q=
uot; on a file that doesn&#39;t exist at all.</div><div><br></div><div>The =
root and inmate cells do not share resources and the debug consoles are dir=
ected to different UARTs.</div><div>u-boot, Linux serial console and the hy=
pervisor debug console are on UART1, and the inmate is on UART10.</div><div=
><br>Thanks,</div><div><br></div><div>Nir.</div><div><br>On Monday, Septemb=
er 2, 2019 at 6:27:50 PM UTC+3, Ralf Ramsauer wrote:<blockquote class=3D"gm=
ail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc soli=
d;padding-left: 1ex;">Hi,
<br>
<br>On 9/2/19 5:11 PM, Nir Geller wrote:
<br>&gt; CPUFREQ is set to performance, and I&#39;m setting scaling_min_fre=
q to the
<br>&gt; highest available frequency (1500000)
<br>&gt; CPU idling is disabled
<br>&gt;=20
<br>&gt; Now I see that executing a simple &quot;cat somefile&quot; on the =
command line
<br>&gt; causes a spike in jitter
<br>
<br>only for the first time or also for consecutive calls on the same file?
<br>IOW, can you observe/trigger the spike when somefile is in your page ca=
che?
<br>
<br>Does the non-root cell share any devices with the root cell? (e.g. debu=
g
<br>UART)
<br>
<br>=C2=A0 Ralf
<br>
<br>&gt;=20
<br>&gt; On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild w=
rote:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Am Mon, 2 Sep 2019 06:12:00 -0700
<br>&gt; =C2=A0 =C2=A0 schrieb Nir Geller &lt;<a>nirge...@gmail.com</a> &lt=
;javascript:&gt;&gt;:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; I created a kernel module that catches/releases=
 a spinlock and
<br>&gt; =C2=A0 =C2=A0 &gt; disables/enables preemption, and it had no obse=
rvable effect on the
<br>&gt; =C2=A0 =C2=A0 &gt; jitter, however,
<br>&gt; =C2=A0 =C2=A0 &gt; the operations insmod and rmmod definitely caus=
e spikes in jitter.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; Any pointers?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Do you have any power management features enabled in=
 that Linux?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Henning
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; Thanks.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscat=
ed-mailto=3D"YjhMte_DAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39=
;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39=
;;return true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"YjhMte_DAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6=
a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a3c23a=
6a-<wbr>95ee-4baa-9714-229c84d9d5b7%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3c=
23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee=
-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a3c23a6a-<wbr>95ee-4b=
aa-9714-229c84d9d5b7%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69047717-186b-4e56-b8af-50294e493caf%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/69047717-186b-4e56-b8af-50294e493caf%40googlegroups.com<=
/a>.<br />

------=_Part_1185_1152859008.1567502640421--

------=_Part_1184_417566359.1567502640420--
