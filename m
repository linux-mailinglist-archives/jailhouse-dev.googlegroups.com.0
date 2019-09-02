Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBM7CWTVQKGQETI544DI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F102A5A3F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 17:11:49 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id t26sf8963810otp.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pTr6ERVialbBn+FSPeuMMWN4wF+K9hT1tKqCrO835xI=;
        b=ffMnKH9VZQ4jN2JjOWK5Eka1Juvdcil6XZEJzbGg23HR4G7ePONT6ekNiRvrgS1cJv
         UOftl59++vacGNIzrghSzMElfW2euUJqELWx5MdXe4ZEHy+K6A1KerSjapLHzgYh5CXg
         ML4uyD0FJ79GQWyOJh1PzX0WxSuCf93dPtP2lwuc8YP5n9BlCuUrb7iBDOyeSqMyE9Gp
         MNOy0eL6+9/TQaylMF1peVNE3RSfVXPUBrgPogIhpn4Gw9CPXqUYDJpVgsJYZXe6WjrX
         JmQeYdtm4wjqCckv3FRguuGR5/dzUXd4o65K+bKmSoN3oH3Bepvq+H6oBxzRWHYajwUs
         Mv1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pTr6ERVialbBn+FSPeuMMWN4wF+K9hT1tKqCrO835xI=;
        b=vH3RQX2w2pPW7rV4XczMxw71+uzYV/ODutofXEkbtkhzmYFzeXVpL1p62Jj1jrj5JH
         JElZqTrnvb6Ba+ArpVG3PU2LuOWwFoMFMxvR6FpzxilJKFEt7HVTX2d5SFtYKa6l1U9y
         uewn6fPkZf3kshli6zZTWhFXneEKYuY9zWFJXENMrLoXUaOCs/qqiaEvRQ3pwICjZyyu
         Spmo3Bn+0S+4IAQKIot0PC2m+bOt+jF2Bvi5LEe3wZrEb5JiIYDzhPecwPbz2BhoYIQ8
         hkPWcye/GYcu9jD1+PQ5vwTwADnX1pDNR7TOnVa5xc1R2vX7UABv0xiGZMaDn/l4tZOJ
         Sveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pTr6ERVialbBn+FSPeuMMWN4wF+K9hT1tKqCrO835xI=;
        b=CzSYAJEutIwnRMZbZtvJEV5bgPLfMU+IocqL61dK2Sr/DWt3phEz9uzBwRVJCVwxNU
         XQ3z8aNhjoxeIezIvYpZZqoRmu+jMqNNEkSZRJcwTflq0SXf2XUFaxhwEi0YCVfZId4/
         XN3xIEBKshHvZHYrxUtMuwALBiThPYVmEo6PPh+VnZFDt97/8DpiOzqqKMpU270ymMcx
         CCBft/0kNUhjBGTCBMYTz+zvHW5Z4UZkX3DqvqR0vWAywwjtJDgBptUJLaP/z8gUykQ3
         ri5HDwMfRE0EpNEQgpyGTB+gGu6iIa/1bisGQtylQPL3wZsfoBFX1AmnpFs9Hi7pNSDn
         s4SQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgyD5nbC7dZ53IO9rq+ZS43G7Yk5B/6Hnp/jXf/JA+1CiGd5cy
	9VG0zJOjxEWm7K4QlbAdNmY=
X-Google-Smtp-Source: APXvYqz3xYlXHaUnf1aHBk0p4mMyGA7Cuz96LAz6xYx3AB8Ekv1LKWSwaxbDO7vV4wLp4Auf0BGnBQ==
X-Received: by 2002:a9d:7f05:: with SMTP id j5mr16202435otq.102.1567437108031;
        Mon, 02 Sep 2019 08:11:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1d56:: with SMTP id p22ls1167219oth.1.gmail; Mon,
 02 Sep 2019 08:11:47 -0700 (PDT)
X-Received: by 2002:a05:6830:c1:: with SMTP id x1mr4116119oto.272.1567437107499;
        Mon, 02 Sep 2019 08:11:47 -0700 (PDT)
Date: Mon, 2 Sep 2019 08:11:46 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
In-Reply-To: <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
 <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
 <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
Subject: Re: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1243_65235405.1567437106918"
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

------=_Part_1243_65235405.1567437106918
Content-Type: multipart/alternative; 
	boundary="----=_Part_1244_2032756357.1567437106918"

------=_Part_1244_2032756357.1567437106918
Content-Type: text/plain; charset="UTF-8"

CPUFREQ is set to performance, and I'm setting scaling_min_freq to the 
highest available frequency (1500000)
CPU idling is disabled

Now I see that executing a simple "cat somefile" on the command line causes 
a spike in jitter

On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild wrote:
>
> Am Mon, 2 Sep 2019 06:12:00 -0700 
> schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
>
> > I created a kernel module that catches/releases a spinlock and 
> > disables/enables preemption, and it had no observable effect on the 
> > jitter, however, 
> > the operations insmod and rmmod definitely cause spikes in jitter. 
> > 
> > Any pointers? 
>
> Do you have any power management features enabled in that Linux? 
>
> Henning 
>
> > Thanks. 
> > 
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com.

------=_Part_1244_2032756357.1567437106918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CPUFREQ is set to performance, and I&#39;m setting scaling=
_min_freq to the highest available frequency (1500000)<div>CPU idling is di=
sabled<br><br>Now I see that executing a simple &quot;cat somefile&quot; on=
 the command line causes a spike in jitter<br><br>On Monday, September 2, 2=
019 at 5:51:24 PM UTC+3, Henning Schild wrote:<blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padd=
ing-left: 1ex;">Am Mon, 2 Sep 2019 06:12:00 -0700
<br>schrieb Nir Geller &lt;<a href=3D"javascript:" target=3D"_blank" gdf-ob=
fuscated-mailto=3D"rSdsl_LBAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;">nirge...@gmail.com</a>&gt;:
<br>
<br>&gt; I created a kernel module that catches/releases a spinlock and=20
<br>&gt; disables/enables preemption, and it had no observable effect on th=
e
<br>&gt; jitter, however,
<br>&gt; the operations insmod and rmmod definitely cause spikes in jitter.
<br>&gt;=20
<br>&gt; Any pointers?
<br>
<br>Do you have any power management features enabled in that Linux?
<br>
<br>Henning
<br>
<br>&gt; Thanks.
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
om/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com<=
/a>.<br />

------=_Part_1244_2032756357.1567437106918--

------=_Part_1243_65235405.1567437106918--
