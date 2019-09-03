Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBLXEXDVQKGQEVN5TGGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345CA6529
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 11:28:16 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id t26sf10283215otm.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mnICmu9sAKFn4GRBnOs7E6WaLRylktb6JkQabd1SpB4=;
        b=RlUkkDHBJTrArgy7nOJ/mg5Mne4u5qHFMWGthJTKhsTNeq5egE4vs4cdtodPkDb7mA
         kgIyW9Xi101HnHE6iCqhWc4NfMmhhlAkUfN2n+UFxw/N6hN2iTyKQlfE/gXIJY/b41ob
         7qllGnjKvlFt2wIjL+WZ3CoswpBjMtR3XKlXXz7B0PLEuZoX4Yqyi3hwi5ANpct3tC7F
         woY6OPABvIkC/jDa/2p6GmSwsg7Weg5G2P3Akz2rmXpMA3P5P+U4Ifa6Jqnl3EGfEtPS
         KOU7lVngdReFtfGnCDIMDH8yLXq9NdLBAoKqmHsW048I+htJepB4m4jBQyP3lfeCoBEz
         ViPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mnICmu9sAKFn4GRBnOs7E6WaLRylktb6JkQabd1SpB4=;
        b=ks4NdA6oum/JcSSUJNzeV6fua09BLuRm0QeJdlQMUcQOoZn6FhHAySA8KMwpJW8u+q
         DQp9ud/FDJke35+MLstPX3rlSZOF/G/Dz8MlYbmyeEJD21VjwGJVHuYFZpBO86ivclQ3
         KT0Sd6FxfJZZVcB9+cF+w6KDQhWupWdHNHUaRLNvc/dxHZdaupkaUSLP/Gn+48HRK6WH
         QD5sZ354jR8rLcZAh9IKGzt5ZDS6PqhVV4Pf3f41SlOVBDxK2euHLB+dTikpYGVOCNlb
         vg7um290SzYt4cu2P6OrwhrRLz0Wz51Si+7GYz4ujN/wqH9USU6LpnPuhg5MlubOKD6+
         yvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mnICmu9sAKFn4GRBnOs7E6WaLRylktb6JkQabd1SpB4=;
        b=X23U48jqy9afyZR2emBYj7USn6ZUTXpGvLQ0I+LSTaZf07q6LhCxcWEJ6M6A/WX4AW
         5O1TtlQpxyISY0sdoSeu4NI/kZ2uEZddkhdSy5dUnqTMsiFBs+zcBLF0LP1gtXEo5Qm3
         nS0q0Mqc0fvcjEedtPSH2pSsx23t8F1vlljiKW61hkGzNdGT5GEJhyF9qPmdZb/mlYCD
         GaU5XMX/NtP4ts1uLoh3vYq910D16HmMQprDr72+ExTUxoqpM6ya4nUm+/hLKcRisrZx
         7ypNnryF+j5EwkcEvOBLQ8RftPQ7NolTe4doYZ30UtTWGALRpn3A5RnkDW7WKFYu2+Gi
         DVpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0voKxUt/VtZPimEmbNremtES0UpPwk2ki8qRAD1ROdJMdLzfi
	lMpdnL/z6euslq+4ozzZW4M=
X-Google-Smtp-Source: APXvYqxkmqAK2uxE5bjrLcGGc5/yDncHCPBvqVDMAiDzmCzL1U7kacdI/RhtNivMwBA0/dEAM0rcUQ==
X-Received: by 2002:a9d:560f:: with SMTP id e15mr12239028oti.246.1567502894910;
        Tue, 03 Sep 2019 02:28:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:1211:: with SMTP id 17ls530012ois.7.gmail; Tue, 03 Sep
 2019 02:28:14 -0700 (PDT)
X-Received: by 2002:aca:4d85:: with SMTP id a127mr6261241oib.154.1567502894240;
        Tue, 03 Sep 2019 02:28:14 -0700 (PDT)
Date: Tue, 3 Sep 2019 02:28:13 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a@googlegroups.com>
In-Reply-To: <20190902185713.0c54ed6b@md1za8fc.ad001.siemens.net>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
 <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
 <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
 <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
 <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
 <20190902185713.0c54ed6b@md1za8fc.ad001.siemens.net>
Subject: Re: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_415_41214428.1567502893727"
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

------=_Part_415_41214428.1567502893727
Content-Type: multipart/alternative; 
	boundary="----=_Part_416_637068855.1567502893727"

------=_Part_416_637068855.1567502893727
Content-Type: text/plain; charset="UTF-8"

Hi Henning

When I execute "sync" I get a spike on jitter.
When executing 
echo 1 > /proc/sys/vm/drop_caches
or
echo 2 > /proc/sys/vm/drop_caches
or
echo 3 > /proc/sys/vm/drop_caches
No spike occurs.

I'm not familiar with AMBA, so I'm trying to learn the subject now. I guess 
you mean giving higher priority to core1
in attempt to narrow DMA latency?

Thanks,

Nir.

On Monday, September 2, 2019 at 7:57:16 PM UTC+3, Henning Schild wrote:
>
> A good way of estimating the cost of someone messing with ones caches 
> is to flush them yourself in your test and see how much that costs you. 
>
> I am not sure how complicated it is to read performance counters on 
> ARM, but those might give a clue. 
>
> AMBA QoS can maybe help raise the IO prio of your RT-cell. If a DMA 
> request is what is slowing down your GPIO. 
> I have never used that but maybe you can configure it from Linux before 
> you enable Jailhouse, and make sure that your root cell config blocks 
> future access to the configuration mechanism. 
>
> Henning 
>
>
>
> Am Mon, 2 Sep 2019 17:27:47 +0200 
> schrieb Ralf Ramsauer <ralf.r...@oth-regensburg.de <javascript:>>: 
>
> > Hi, 
> > 
> > On 9/2/19 5:11 PM, Nir Geller wrote: 
> > > CPUFREQ is set to performance, and I'm setting scaling_min_freq to 
> > > the highest available frequency (1500000) 
> > > CPU idling is disabled 
> > > 
> > > Now I see that executing a simple "cat somefile" on the command line 
> > > causes a spike in jitter   
> > 
> > only for the first time or also for consecutive calls on the same 
> > file? IOW, can you observe/trigger the spike when somefile is in your 
> > page cache? 
> > 
> > Does the non-root cell share any devices with the root cell? (e.g. 
> > debug UART) 
> > 
> >   Ralf 
> > 
> > > 
> > > On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild 
> > > wrote: 
> > > 
> > >     Am Mon, 2 Sep 2019 06:12:00 -0700 
> > >     schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
> > >   
> > >     > I created a kernel module that catches/releases a spinlock and 
> > >     > disables/enables preemption, and it had no observable effect 
> > >     > on the jitter, however, 
> > >     > the operations insmod and rmmod definitely cause spikes in 
> > >     > jitter. 
> > >     > 
> > >     > Any pointers?   
> > > 
> > >     Do you have any power management features enabled in that Linux? 
> > > 
> > >     Henning 
> > >   
> > >     > Thanks. 
> > >     >   
> > > 
> > > -- 
> > > You received this message because you are subscribed to the Google 
> > > Groups "Jailhouse" group. 
> > > To unsubscribe from this group and stop receiving emails from it, 
> > > send an email to jailho...@googlegroups.com <javascript:> 
> > > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>. 
> > > To view this discussion on the web visit 
> > > 
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com 
> > > <
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>   
> > 
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a%40googlegroups.com.

------=_Part_416_637068855.1567502893727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Henning<div><br></div><div>When I execute &quot;sync&qu=
ot; I get a spike on jitter.</div><div>When executing=C2=A0</div><div>echo =
1 &gt; /proc/sys/vm/drop_caches</div><div>or</div><div>echo 2 &gt; /proc/sy=
s/vm/drop_caches</div><div>or</div><div>echo 3 &gt; /proc/sys/vm/drop_cache=
s</div><div>No spike occurs.</div><div><br></div><div>I&#39;m not familiar =
with AMBA, so I&#39;m trying to learn the subject now. I guess you mean giv=
ing higher priority to core1</div><div>in attempt to narrow DMA latency?</d=
iv><div><br></div><div>Thanks,</div><div><br></div><div>Nir.<br><br>On Mond=
ay, September 2, 2019 at 7:57:16 PM UTC+3, Henning Schild wrote:<blockquote=
 class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1=
px #ccc solid;padding-left: 1ex;">A good way of estimating the cost of some=
one messing with ones caches
<br>is to flush them yourself in your test and see how much that costs you.
<br>
<br>I am not sure how complicated it is to read performance counters on
<br>ARM, but those might give a clue.
<br>
<br>AMBA QoS can maybe help raise the IO prio of your RT-cell. If a DMA
<br>request is what is slowing down your GPIO.
<br>I have never used that but maybe you can configure it from Linux before
<br>you enable Jailhouse, and make sure that your root cell config blocks
<br>future access to the configuration mechanism.
<br>
<br>Henning
<br>
<br>
<br>
<br>Am Mon, 2 Sep 2019 17:27:47 +0200
<br>schrieb Ralf Ramsauer &lt;<a href=3D"javascript:" target=3D"_blank" gdf=
-obfuscated-mailto=3D"03EV89DIAAAJ" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javasc=
ript:&#39;;return true;">ralf.r...@oth-regensburg.<wbr>de</a>&gt;:
<br>
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; On 9/2/19 5:11 PM, Nir Geller wrote:
<br>&gt; &gt; CPUFREQ is set to performance, and I&#39;m setting scaling_mi=
n_freq to
<br>&gt; &gt; the highest available frequency (1500000)
<br>&gt; &gt; CPU idling is disabled
<br>&gt; &gt;=20
<br>&gt; &gt; Now I see that executing a simple &quot;cat somefile&quot; on=
 the command line
<br>&gt; &gt; causes a spike in jitter =C2=A0
<br>&gt;=20
<br>&gt; only for the first time or also for consecutive calls on the same
<br>&gt; file? IOW, can you observe/trigger the spike when somefile is in y=
our
<br>&gt; page cache?
<br>&gt;=20
<br>&gt; Does the non-root cell share any devices with the root cell? (e.g.
<br>&gt; debug UART)
<br>&gt;=20
<br>&gt; =C2=A0 Ralf
<br>&gt;=20
<br>&gt; &gt;=20
<br>&gt; &gt; On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Sch=
ild
<br>&gt; &gt; wrote:
<br>&gt; &gt;=20
<br>&gt; &gt; =C2=A0 =C2=A0 Am Mon, 2 Sep 2019 06:12:00 -0700
<br>&gt; &gt; =C2=A0 =C2=A0 schrieb Nir Geller &lt;<a>nirge...@gmail.com</a=
> &lt;javascript:&gt;&gt;:
<br>&gt; &gt; =C2=A0=20
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; I created a kernel module that catches/rel=
eases a spinlock and
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; disables/enables preemption, and it had no=
 observable effect
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; on the jitter, however,
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; the operations insmod and rmmod definitely=
 cause spikes in
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; jitter.
<br>&gt; &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; Any pointers? =C2=A0
<br>&gt; &gt;=20
<br>&gt; &gt; =C2=A0 =C2=A0 Do you have any power management features enabl=
ed in that Linux?
<br>&gt; &gt;=20
<br>&gt; &gt; =C2=A0 =C2=A0 Henning
<br>&gt; &gt; =C2=A0=20
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; Thanks.
<br>&gt; &gt; =C2=A0 =C2=A0 &gt; =C2=A0
<br>&gt; &gt;=20
<br>&gt; &gt; --=20
<br>&gt; &gt; You received this message because you are subscribed to the G=
oogle
<br>&gt; &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; &gt; To unsubscribe from this group and stop receiving emails from=
 it,
<br>&gt; &gt; send an email to <a href=3D"javascript:" target=3D"_blank" gd=
f-obfuscated-mailto=3D"03EV89DIAAAJ" rel=3D"nofollow" onmousedown=3D"this.h=
ref=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javas=
cript:&#39;;return true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfu=
scated-mailto=3D"03EV89DIAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D=
&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:=
&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;=
.
<br>&gt; &gt; To view this discussion on the web visit
<br>&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3=
c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/=
msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com=
&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d=
/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.co=
m&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a=
3c23a6a-<wbr>95ee-4baa-9714-229c84d9d5b7%<wbr>40googlegroups.com</a>
<br>&gt; &gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=3Demai=
l&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/a3c23a=
6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium\x3demail\x26ut=
m_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://g=
roups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7=
%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return=
 true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a3c23a6a-<wbr>=
95ee-4baa-9714-229c84d9d5b7%<wbr>40googlegroups.com?utm_medium=3D<wbr>email=
&amp;utm_source=3Dfooter</a>&gt;. =C2=A0
<br>&gt;=20
<br>
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a%40googlegroups.com<=
/a>.<br />

------=_Part_416_637068855.1567502893727--

------=_Part_415_41214428.1567502893727--
