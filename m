Return-Path: <jailhouse-dev+bncBDUK5F6DWYKBB7PAYKZQMGQEJ3BMSVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268090BD13
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2024 23:54:07 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dfeec5da777sf8358219276.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2024 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718661246; x=1719266046; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6uWt5HeVJ3cJ3Nea/QNI3T9Kxmf7Q1aTB3frL84mzs=;
        b=Ck9PykQn11wovSQoiH7Rbj+SaCjQ4UXS5d1biIjjwrYza7DoKJjTtu9kTsIt6kpvQp
         bknzSKYIqFki3LlSrkQHfq1xSfpXa+/5ma/jvPa2xmf04Zxt0gJnLyBqeQAWKvDV6QJt
         YoIzxFTvupCKKvypFTC9dIpbKun95S/w7bBKiI0nEsBhxQRQls96xkdYzFFCRxib/hs0
         FznPk41R30CCmU6btHWWQ1voiP4Bm406xur6BYPe3au70QW0kmwPbKht2ctCuH6h/Vkp
         14fSS/P1QKMwyI/bVEmSrh68rlQYLLYUHhCPubQqLgRUCF+PAnKYaODY/4otWwqSZmbC
         Zy6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups-com.20230601.gappssmtp.com; s=20230601; t=1718661246; x=1719266046; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6uWt5HeVJ3cJ3Nea/QNI3T9Kxmf7Q1aTB3frL84mzs=;
        b=uE661+RK5BtWp/kDCIugU0tqX0TTBqUR+HRCtZq8a0QCm/x3eUqU+HjengEhRDCHyn
         wwAvVflsRksJoS5qHLdvK+en6OBmzjiEk9ca0zbvpoZJ0CFRizJf+1oUBWJP/enamOX2
         oQH6w7ri8WvbLS8a0tgXkOqYQsJLIMbSPHDwnQi5SKCP1YgOvOpQKpvpe9Y14kfZPsgi
         txUmRgeI97NFM6xDZzBQWj3ujRtHvba16W2gIqafegSYXP514SeDqMLN27VXpDJDp2jG
         RuVDXFGSdvDfbzl5b/ttFdMEJ8rMXMUWSbtb6F/4YWJgM73EF5TP5MXQQSyjqmByQ5bP
         iXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661246; x=1719266046;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6uWt5HeVJ3cJ3Nea/QNI3T9Kxmf7Q1aTB3frL84mzs=;
        b=q1AaG5ysMx4vsnK5SOCnYNoDyORCyFNAUiKVHz6dx/PDiN3H2rZcuMK/vQl185eaeH
         xvfNTEYv2tZUsNl7BRcWRZL1vups8DcUK3jp+Bazo2i1fsy0i8zCZ8L4UKq8XuTlIDaQ
         RLDEDJUMNM8fb5TrM5jiqP62RC89TqKyQ/aGSYaR/ylFvsXehiVFSUjJhIzclJlVSsxq
         ekBG8Zw4J42NvRPYqY92wQZtI+VDnOAvvqEt/45yz/Ja1YMLe6ZT+ptKkvhd/HAvKk/z
         9CtztE1BM+CsqvQKZasHWY/W8CjXlrwDz+kcy91bJ1PwsgVnY4VbfCkzVUaiWX8dQbVr
         /QDw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWiamZnU9/UcleYQVSdiaDbfxNeRNNW43icSVFNc3FztUBQ34xZYUg2YY7+McThP7PYtUIduVKtlPAfd6TWU/hu7OBMSP6+EripikY=
X-Gm-Message-State: AOJu0YwRU3HNxbs/BkgjQqyuxVN98XXKKCld/Qa+ZftjfXYOFi6y3IIP
	cYf1xEAmx1jka6BmbKtUh8fjizRbWrkHxBA25jkxuvofXpx1Myfa
X-Google-Smtp-Source: AGHT+IHtMxzN0eeCruyqwBkKCGUx8EGdc/P/vSIZCy4Gg3lsX/4x+spjgWMUtevsMvVSkmoNXlcEmA==
X-Received: by 2002:a05:6902:1201:b0:dff:2a78:fbe8 with SMTP id 3f1490d57ef6-dff2a78fde8mr8733232276.49.1718661246051;
        Mon, 17 Jun 2024 14:54:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1003:b0:dff:34c9:9303 with SMTP id
 3f1490d57ef6-dff34c994b3ls3280382276.0.-pod-prod-04-us; Mon, 17 Jun 2024
 14:54:04 -0700 (PDT)
X-Received: by 2002:a05:690c:308a:b0:62f:f535:f41 with SMTP id 00721157ae682-63224a0582fmr28235117b3.9.1718661243951;
        Mon, 17 Jun 2024 14:54:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:54:03 -0700 (PDT)
From: david <david@fatslice.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <290c4879-07a9-44b7-9673-040557333ab5n@googlegroups.com>
Subject: Armv9-A
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17861_664668325.1718661243261"
X-Original-Sender: david@fatslice.com
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

------=_Part_17861_664668325.1718661243261
Content-Type: multipart/alternative; 
	boundary="----=_Part_17862_52991344.1718661243261"

------=_Part_17862_52991344.1718661243261
Content-Type: text/plain; charset="UTF-8"

Some Armv9-A's are around the corner. Curious if anyone else has been 
looking at this. What would be the efforts supporting a new platform?

Also interested to hear if someone has been using Jailhouse on Armv8 based 
SoC's from Mediatek?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/290c4879-07a9-44b7-9673-040557333ab5n%40googlegroups.com.

------=_Part_17862_52991344.1718661243261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some=C2=A0Armv9-A's are around the corner. Curious if anyone else has been =
looking at this. What would be the efforts supporting a new platform?<div><=
br /></div><div>Also interested to hear if someone has been using Jailhouse=
 on Armv8 based SoC's from Mediatek?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/290c4879-07a9-44b7-9673-040557333ab5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/290c4879-07a9-44b7-9673-040557333ab5n%40googlegroups.co=
m</a>.<br />

------=_Part_17862_52991344.1718661243261--

------=_Part_17861_664668325.1718661243261--
