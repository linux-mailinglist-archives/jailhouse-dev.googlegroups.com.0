Return-Path: <jailhouse-dev+bncBDM2HMO5Q4HBBD4Q3KWAMGQE7Q2CMNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F22823F6B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jan 2024 11:27:29 +0100 (CET)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dbe9dacc935sf353289276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jan 2024 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704364049; x=1704968849; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2IZ0yh0aabDGqSZD5zBHC81B87P7Tn+ICPFGkLe3Lg=;
        b=qhGEeUslt1qY0dL9zUDSg6TMz+jcoe0P0cXpPWLI1pS0d/WxjpZTDVzDk3f49YO/z7
         KFX1TTHtnau99+LVP/zRP4dqEB1SJ77wIhABWo0vMuUzhf1tXjQhufU6S2gBhs8hnTP+
         M+SU5eMDP+ZN7xWa51u0XQODymZuLTX5v2LRba2OUV5gzAmRm3cJyXY2IgVLq3mwuwkr
         Oh0qGidRrBNFL7oHwK7HAIYgExTEBmTdm+3mk9ub/HDYSC8UFFvNX1Fw6gCQksShab7S
         OPtk/NPFVPyYp7R2P1M1DOSTWJ3W42sKypo2N37o/ZPN2AURxSc01mXcnbrjOBHEovjW
         gttA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marples.net; s=mail; t=1704364049; x=1704968849; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2IZ0yh0aabDGqSZD5zBHC81B87P7Tn+ICPFGkLe3Lg=;
        b=b0fTmZyDNYF2ExaILxRF0oBrnjKhWzUsJZqZl8Sso8TnTPkDoWMsx3LCDmgf1o0iBL
         mx3X/lolPVjjgtiwoRCpWlhOKZz/eOqLhihvmOH7LIo3gn2cEvhO2yTEdHefm2OkEFQc
         bYbaUwXj+Vni2OHcgyIiiyajAAJud70nAuebg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704364049; x=1704968849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2IZ0yh0aabDGqSZD5zBHC81B87P7Tn+ICPFGkLe3Lg=;
        b=hqQhiezHFrfAZFKHjzAw9GfNKu/IkujQNn1GoegjV2SBFmwyrKdKUD2yswxs9MbxYM
         10nraLjdq1HwfWFJt1SsIU6F1kztLVkC18i9SELwcTv9rPR8Dh0EJoO9C3wqBRXDpwp1
         0KHHEQ3NeSGBqWjCX9aK+v9s4IdHnIzPxaQ7AKaKlVZcXYUwVYnzY5ZaXjPIheDFL2Uq
         iSp01aFU7tw7S95qkthNmaFFJU45R9cV5zLTzq/yCR1Jg7TwQn2915j2zqBf1yaVVsyH
         7Wb8qFGMAFa9LpwLksqG5osfr44RP1YHle1PtFEmOBCwoIpl7T8h6Qom0f1rF4SffJbo
         JyOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Ywd0oYgkS0gH4iJ/4FjLJRCoQYJbaT8ec0CX8IiDkd59MIzPfvQ
	L7qOFaZjN5+L4RpQaFlaK98=
X-Google-Smtp-Source: AGHT+IG/4ywmvdXPljOKVsXoqV1oQoUSHkRsPt9gUCAcT2+xlFVqNT3soMSkNf9V+7wOV2T8jsP75Q==
X-Received: by 2002:a05:6902:3ce:b0:db5:4d1d:ee76 with SMTP id g14-20020a05690203ce00b00db54d1dee76mr253348ybs.64.1704364048622;
        Thu, 04 Jan 2024 02:27:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7396:0:b0:dbd:56e0:2fad with SMTP id o144-20020a257396000000b00dbd56e02fadls10806ybc.2.-pod-prod-09-us;
 Thu, 04 Jan 2024 02:27:27 -0800 (PST)
X-Received: by 2002:a25:bcd1:0:b0:dbd:47f8:8735 with SMTP id l17-20020a25bcd1000000b00dbd47f88735mr126551ybm.9.1704364047113;
        Thu, 04 Jan 2024 02:27:27 -0800 (PST)
Date: Thu, 4 Jan 2024 02:27:26 -0800 (PST)
From: Dave Marples <dave@marples.net>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c33ce025-503c-4a9e-b17d-c792587adbb8n@googlegroups.com>
In-Reply-To: <2305fab7-744f-4cef-90fc-08879ff55ae4n@googlegroups.com>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
 <2305fab7-744f-4cef-90fc-08879ff55ae4n@googlegroups.com>
Subject: Re: Can't install jailhouse on linux-6.1 arm system
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5499_1559788570.1704364046337"
X-Original-Sender: dave@marples.net
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

------=_Part_5499_1559788570.1704364046337
Content-Type: multipart/alternative; 
	boundary="----=_Part_5500_1956999951.1704364046337"

------=_Part_5500_1956999951.1704364046337
Content-Type: text/plain; charset="UTF-8"

The patch is pretty straightforward and attached to the message above, but 
in case you're having trouble getting it here it is as text;

``` diff --git a/mm/vmalloc.c b/mm/vmalloc.c index 
52f50fe7db83..7fbfad571968 100644 --- a/mm/vmalloc.c +++ b/mm/vmalloc.c @@ 
-316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned long 
end, { int err; - err = vmap_range_noflush(addr, end, phys_addr, 
pgprot_nx(prot), + err = vmap_range_noflush(addr, end, phys_addr, prot, 
ioremap_max_page_shift); flush_cache_vmap(addr, end); return err; ```
Good luck!
DAVE

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c33ce025-503c-4a9e-b17d-c792587adbb8n%40googlegroups.com.

------=_Part_5500_1956999951.1704364046337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch is pretty straightforward and attached to the message above, but =
in case you're having trouble getting it here it is as text;<br /><br />```=
<span style=3D"color: rgb(0, 0, 0); overflow-wrap: break-word; white-space-=
collapse: preserve;">
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 52f50fe7db83..7fbfad571968 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned lon=
g end,
 {
 	int err;
=20
-	err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
+	err =3D vmap_range_noflush(addr, end, phys_addr, prot,
 				 ioremap_max_page_shift);
 	flush_cache_vmap(addr, end);
 	return err;
</span>```<br />Good luck!<div>DAVE</div><div><div dir=3D"auto"><br /></div=
></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c33ce025-503c-4a9e-b17d-c792587adbb8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c33ce025-503c-4a9e-b17d-c792587adbb8n%40googlegroups.co=
m</a>.<br />

------=_Part_5500_1956999951.1704364046337--

------=_Part_5499_1559788570.1704364046337--
