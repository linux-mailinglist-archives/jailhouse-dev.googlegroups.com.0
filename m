Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBINKWTVQKGQEVKPJCMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 036ADA5771
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 15:12:03 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id g8sf8824766otj.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8IBV0L3x/j0iMG5u3vsbapmZO7WQbQeirPCRQJIZGw0=;
        b=PW9AdhhL3MUOeIjXm8y98nVaUHTU3nwrnkZnBcScwckKDzep2eQeCi0RE8Xw8ngffB
         uX+SGfhlAjrsJ4NspLHeA857gakjKqIb5t/D49frqvhqPgiuk881XKgZ0wUSCsxZUuGJ
         zQrMaJf4zpf1vsDDvGDcdzkvJ3CgFC4zyhPBhnoxyvjj8DnjrnpbR6mDq66hJmNj1ZR8
         /9ksVIReuH6JSjeq8hbN15lxbHLIeDdnSUCKrnaBboqL6ARqwvJ1N25qI7rv/4/zaUia
         IzeLCM6iFkVtE7xYqVIUpHrvNCxq3bdGa8hOictgUK339zzDwt6tVTMvL3F9Pe35BBW9
         QRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8IBV0L3x/j0iMG5u3vsbapmZO7WQbQeirPCRQJIZGw0=;
        b=i3D/vGnuAFvtCZ9d/9Lup2iWK9BN8p2lrgYEWoayEoIHN9Z1QFTbGJ7Hmmit3NMRaz
         NmkD4GFatA5i0ilWSV6g0NDyJClm6HxNJArzcurewhBgbmBPrW4uD7XtO1YIiAgJaJFF
         wTGxPm+WRghDp6livgVT5vM/qBFBN/W+vXEmS4YiashbcPZZXTeFofcuqhVIdYJ6Nv7L
         DqDHH1Ynfe+29Z4lIhl7YjLLvpEY+khW8UUirdGDdtjzI3yuMmqKy3+r6XsoaTZH9CO8
         Y11aLU6U0g9VUY8AWpJppFz1lh0FtXLev9Pflu2vSsy08MSa+dBz74OzNVShYn1hyXlJ
         BKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8IBV0L3x/j0iMG5u3vsbapmZO7WQbQeirPCRQJIZGw0=;
        b=qqA+fzKNmtnL1Z9mWgvkl65VF7AcdQUNB+2kRpBfBz1a/W+3ADNm7+8WWsPKfBNhtb
         zXU+jmfeQslFoeAUqZFisxnpPM+tkfiPIlFUyQTPbDHI/fS/mwwfGbJMvFF2TtVV9zNM
         z13FBLWYtZ7cgjgd5tMcvsJr7iLVeLrSEcP/5kzpCQXOBrWocS2l0XswOgoyvfx07Gl7
         nsdvtA7aR5ScsX/2x612VLV/iTx8NssKcywn+f7UC5QvJKgowcN8sSPp0D0sZfUiS+FR
         R8oHOWHc2ivMTNA9Sch52X0H1kClQw7Swf1y0MoM8N1tUNcP2ntlUpbKQYyldrI4fiFF
         pqug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVApLS+4rwp2lwe1UBhM6PK7TPu8bWa/fyHvPuoBe+JOtWhhX4Z
	XK1koKXp5B3bFE+kbjeHuUo=
X-Google-Smtp-Source: APXvYqxBmnm7XpkLjrKsmLUoNRmnJNlx7LvggHNC7CzNiKL5aszmBF8GMasKCODx6tKMCMGlsNWMXA==
X-Received: by 2002:aca:aad4:: with SMTP id t203mr7197340oie.75.1567429921901;
        Mon, 02 Sep 2019 06:12:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c615:: with SMTP id w21ls1272530oif.15.gmail; Mon, 02
 Sep 2019 06:12:01 -0700 (PDT)
X-Received: by 2002:aca:5d82:: with SMTP id r124mr19312208oib.60.1567429920919;
        Mon, 02 Sep 2019 06:12:00 -0700 (PDT)
Date: Mon, 2 Sep 2019 06:12:00 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
In-Reply-To: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
Subject: Re: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_179_330314991.1567429920319"
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

------=_Part_179_330314991.1567429920319
Content-Type: multipart/alternative; 
	boundary="----=_Part_180_614082978.1567429920320"

------=_Part_180_614082978.1567429920320
Content-Type: text/plain; charset="UTF-8"

I created a kernel module that catches/releases a spinlock and 
disables/enables preemption, and it had no observable effect on the jitter, 
however,
the operations insmod and rmmod definitely cause spikes in jitter.

Any pointers?

Thanks.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d%40googlegroups.com.

------=_Part_180_614082978.1567429920320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I created a kernel module that catches/releases a spinlock=
 and disables/enables preemption, and it had no observable effect on the ji=
tter, however,<div>the operations insmod and rmmod definitely cause spikes =
in jitter.</div><div><br></div><div>Any pointers?</div><div><br></div><div>=
Thanks.</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d%40googlegroups.com<=
/a>.<br />

------=_Part_180_614082978.1567429920320--

------=_Part_179_330314991.1567429920319--
