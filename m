Return-Path: <jailhouse-dev+bncBCBNF7GQ6QBBBL6OTGYQMGQE4W5NBPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2B8ACE4F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Apr 2024 15:33:37 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-de45d36b049sf7208598276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Apr 2024 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713792816; x=1714397616; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgj9RDqCFIxtrDjEV1gqfH91SouYoctFFbyejHw8FgE=;
        b=awkWEjesRvk03sET8xf8sKXXalfkn9MpqzG7ivcR5h9SLG1fMRpa3BHm9LLxRzRQQx
         WnXpdDQ6IhOeOnGSVUjmKId4h/AxId9mkwOzaQSabkM9cAkixwca+u8wza38hlSpKwDK
         hQHMaZeVL1bW3sGKNRxuZT3b5xO/xDSpgc1bwCFrp5gmqJNeXFI3yFpplMlP15RScUv9
         yJ27HN9PTWEATkGoD+Lktgx44xx6eqtjaWmmJWkIGL/SxFLjyOQue2jNUG5VBrj5EMqV
         oWHCkDdGYarK7EdsBnc/p1RFhuma8qENjShGNImccJ/4bl/D6wI0iNB54Tm0WHkSZg4s
         pNgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713792816; x=1714397616; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgj9RDqCFIxtrDjEV1gqfH91SouYoctFFbyejHw8FgE=;
        b=iQoDNGnlST8WtCLKySTjQIEvDZgFQPxiV/1Bmg06wdqsa2hNkXecgJlbD77ueZvVgP
         ug/mLKVRuKmSFwvjl65rNppYScbKGR4I8rrklxUO3G85NGSlt5kvHt9DMHE/SKSX39nW
         HxkkosIFBNJYHkEWJMhvjkcoPy8b8W16TBIVBTgIWHGCuLelzh8pdrichYjLKyHCUAEb
         YN+XsJGGpbK4NynEBliRsMXvIFRaPTp/DNX3nInni7sVhx2QC45A2hsAdzH3WUEZCe76
         XO8LrrBEs8rC55IvjyWFCT0fSUfVKFcMYhZfcPEAxbPqI4913fzNauXASbrH9l/BcZIG
         c9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792816; x=1714397616;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgj9RDqCFIxtrDjEV1gqfH91SouYoctFFbyejHw8FgE=;
        b=vETV7cRmYV4jEd/OeL4xVd44SBVrAw8gyll29R0xMeU8xkDfAbp81pmgKP3+nPvres
         c6cWF9avY9aQHgWuI55HR8wX8s1487s1sAB/vB3t2e1kaY1sScxPubQliwQGsGt0h0P0
         O7k9VU4HYlyd+bkGtO/pIcKcyjKnk3V87GAjNAJXOclVm3TTozuJzfJfBD5Wd/RBf9Qm
         AyKHpszgZqEMM3mKFppmXuKnlrtj/wZlLDRkAklxJhb3aDf2PhrPUISI3nUp33shbDSg
         v9kamcz3ciU0AMBqRzUgVIlbYGVDTP3PXkC6TaLPolijTa7/3tFxEwgCxkeVdPzwiGaM
         DEvg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVOnGRpWJC0W8eUjIyLjnTWov9/1Ox/zWWvkLWqX+7LfkPkVoz2JiM0DRtYQhufIOhK5UWaNa9wAWfrwQKBJE/m1U+LpljuZAD/ND4=
X-Gm-Message-State: AOJu0YyV05bzhyAVeqWeNGIMLuRhIpzyDcf3kwZK/wkt11fVL4OZQTDt
	gJpRV1PH5zkRuom8CvAe/+CTFeOmAyRwcf1lT9L6sdQwePPl0AKK
X-Google-Smtp-Source: AGHT+IER2hD+1FVy+AgmgCL19tcnQlXYbNKHTt8RajWNZ09qGcTidg/fYlVh/7u7WQquHsDEQFfxcQ==
X-Received: by 2002:a25:55:0:b0:dcc:f0a:e495 with SMTP id 82-20020a250055000000b00dcc0f0ae495mr8603898yba.3.1713792816201;
        Mon, 22 Apr 2024 06:33:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7442:0:b0:dcd:a08f:c83f with SMTP id 3f1490d57ef6-de480594890ls187256276.1.-pod-prod-08-us;
 Mon, 22 Apr 2024 06:33:34 -0700 (PDT)
X-Received: by 2002:a05:6902:2b88:b0:dd9:1db5:8348 with SMTP id fj8-20020a0569022b8800b00dd91db58348mr3182262ybb.8.1713792814473;
        Mon, 22 Apr 2024 06:33:34 -0700 (PDT)
Date: Mon, 22 Apr 2024 06:33:33 -0700 (PDT)
From: zehua xin <xhzsddx@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69dc8f2b-60f0-45e7-8003-b258b67eaac9n@googlegroups.com>
Subject: How to start non-root cell in Raspberry Pi 4B
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_117320_95577353.1713792813837"
X-Original-Sender: xhzsddx@gmail.com
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

------=_Part_117320_95577353.1713792813837
Content-Type: multipart/alternative; 
	boundary="----=_Part_117321_169145279.1713792813837"

------=_Part_117321_169145279.1713792813837
Content-Type: text/plain; charset="UTF-8"

How should I configure my Linux kernel so that it can boot from non root 
cells? The hardware platform I have chosen is Raspberry Pi 4B

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69dc8f2b-60f0-45e7-8003-b258b67eaac9n%40googlegroups.com.

------=_Part_117321_169145279.1713792813837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How should I configure my Linux kernel so that it can boot from non root ce=
lls? The hardware platform I have chosen is Raspberry Pi 4B<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69dc8f2b-60f0-45e7-8003-b258b67eaac9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69dc8f2b-60f0-45e7-8003-b258b67eaac9n%40googlegroups.co=
m</a>.<br />

------=_Part_117321_169145279.1713792813837--

------=_Part_117320_95577353.1713792813837--
