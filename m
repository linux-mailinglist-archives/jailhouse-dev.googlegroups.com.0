Return-Path: <jailhouse-dev+bncBCHKZ6U5VMPBBCGWXL2QKGQEOJJI2MI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA91C2BAC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 May 2020 13:29:14 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id y31sf17175115qta.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 May 2020 04:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588505353; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ne+Vn2NIQRSOXPVjA0kUleoPGQbtRayuaTIf9I1QtTdav+IWqbpYIuGGWxzCLSm/Hd
         0cU3J4O1EGOf9iGX/FEQRNISbSvcGIT9r3Em3DGM6SsUdZh9AmtObURcQtC+nz/Q2bCN
         11o72jdl5vQFZxxgBWTXe/5VSmluZiUW29ZtSc5tRrijZXFTqJ4kVWi59P46RUuCe98l
         zgLPVGY46r/cEBz1kqrhyrjmRGQ7Q2KwcLqgDKVzi+eJUa8KWXSa/lWq4B+gzvUJQBxL
         +r/wltMpaTL49x4LFobV2sQamd3eclJNXjqC62SYf42Dh7QzRvEiq1sYud2jleCp6wwP
         7Osw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=U8EnjsPXKVp4GrcPu4N3cyLwNYkHAPlyGA6broTgXBU=;
        b=Hea6Xvps/dC68RODXL6emM1UPhc8qJwrhOx4Zhvzi70Noxp7lDQQeIHTHWcvTUsBrA
         sZLkB2IGTX5rSLfkcsqwc6M2poFIAq0sEQMgP9fgWPfnCx700lnl49ZGmnxxlRj7xTw4
         GxuAIemfx3WwcgjmVvp8nESSg0ZgrGPxnwzZG6eNJV0flEkVxy9EGiQiR6AyvBzlJVSH
         o8npqiukIi6G+W4ZwZjr+S+RPaxrTJwaSpcs1M+uPqYuFFeTynU5vcOz0B9opkB06iky
         iRKxDuTop9PJEGe6Cnh7Vxd70g4PhvszTaRib8uESlOh8tATsAtVGYjxAGtgL9/eOrWA
         zHLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kq1bruee;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U8EnjsPXKVp4GrcPu4N3cyLwNYkHAPlyGA6broTgXBU=;
        b=ffukPHrs1RuOc7x3XIlEThweEHTUsk+7lcrHRf2YgFjjpjAXmrj2jWvLLUQ+TffXtf
         +tjHrX+2ja75mZk65JM7X1O1JiKQySKHrOMu+xHE7BZHuhd0q7VdeL845K+sPwGQmNNj
         vdN7xMXy4INDP2/FyMJLwKfTR4Rok6qX3Bo7cHVunx2M/7KwJYZ7Jhc7wQ/yWuK61yWB
         KeyuNkzCUJRMmGgoM7RYQQ4qeHpfdrvqdCqIcOr9mDaLyJYeoyPhQCSYnCkVF59rj2DB
         LdVAPPhqOxSsFGVnuQJKBfL+Oy4R57/k5r9GDgqbEsH0g+PbYDm5/p7xllczvj2kdmLQ
         FYYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U8EnjsPXKVp4GrcPu4N3cyLwNYkHAPlyGA6broTgXBU=;
        b=d4yvfUaQ9JnUdVPXF+dWoPjBZYNWjbpW0jY22tEPY9sH+DsnL4t9uL2Q6C2OHm5LPX
         zxQJjbkh4jRu/ITtfofdzGiKtpX5CC/c1pTh+02qUl25XS8cQlP/R2HhTurdXDiT07T5
         ozwwgaLglV+7d+PF4hi4bFCEvFrkYHwZlKG2KBwnceZvMq/2EjTqvs7cvxB9OgQP79fc
         0/cqyjhv4VL212/LWhEzjqW237KOuB3ybr29crpy3rCoPh5S8EyPMeofG+uS0CNzUEA8
         oq/WaHYYsFv0Ywq9hmW42GytA3tHJsCh9TryZvg/5E72CpeXWGLrfyR5TWDGpKQX8ZZU
         BttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U8EnjsPXKVp4GrcPu4N3cyLwNYkHAPlyGA6broTgXBU=;
        b=eHz9PlaMf+7Pq0FH1RzQZE8WhwNI5YclGMCQBgeRFvpOPkDDNba5lRo/c6FDI5Bm16
         o+w/caIOCVu729uTwAdQ0eBrQODBvodhc/BBELaPynYTk1uSgrVYTr2mmOjyLGaxwWRP
         /TkKTf8aO0qUcDlJkEKSSGa8BQd7G72j00YBVTEF6eEewHuEq/ez5EVz+pU/dd4vPT4G
         /tw1hxIiXIxr9HFfN32VTQKr4G/vu/xEGgxe6CqgTMlwNsSyhYpm4PHcR55Q97i+uyYD
         e1cOLM/xaOlEFfkb9Gf59dqGE6wROUFo/ZUXTTbWuj1hUIPAPkq4S3Ds4Y4riClQvkj7
         ahZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pubcm7p4hJ4uaCvZprBcbbmzJ5Fmiorr6n7nhpX34bsygqVsCb3x
	vJKhuY8AqTTATztKVGcHudI=
X-Google-Smtp-Source: APiQypJ44q5ifmGqfQLh4hMcSwuw+MWq1RUhi4I1yhV3QV8QRkzOS3bEhIbG30XhBO4FDa2gjiHaqg==
X-Received: by 2002:ac8:568b:: with SMTP id h11mr12377320qta.197.1588505352816;
        Sun, 03 May 2020 04:29:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7542:: with SMTP id b2ls7271144qtr.1.gmail; Sun, 03 May
 2020 04:29:12 -0700 (PDT)
X-Received: by 2002:ac8:6e8c:: with SMTP id c12mr12501560qtv.374.1588505352350;
        Sun, 03 May 2020 04:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588505352; cv=none;
        d=google.com; s=arc-20160816;
        b=p70mn2gicA4ObZNgZPxr8B4a0K8/T02ZZJF/X6lAoof630UZyUajKXX+X/0FOIZGGs
         Rhs4iVt5JB5aYvcx76vEOxlbkBucSxlkG3pJIO47UOdLOWmc9LEJD0y4q1JSCuNKUs/N
         QsMdAnHEfoGwFHEe0oyEe2xm4AhpAlMGN9pCvPXZMVOrEWlohtnREUe1+Zj6hW79+Fpn
         gSt22+yyab+vKPvhbFu9LLmPV0OwZvgGMss25VytgCubcOWx4d3ETikEWp0NmII8ka3n
         7Lzh7p2yZZG1w7sodncf33nV3pXd5pefQTImHJX3OQ4WT0nGjwy0Qpebv1EkLgm4HNYn
         s9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tLeCRLuJBcNxumRIY+v1yFtaUZSG0afmnlHn0N8no8s=;
        b=CUshonU3wjop+Tg2gQ8xv2fa/IoYrIP0+LOhdLZzer0fuR3CI18uLrpiN7G6g9ExmL
         pSNZyBAeBurvdvGTOgwT9jg4VPI/rBH+eRjPWJVxt5fGFotRuWiKz21JmX1ehHBf6CHP
         lG+A/pqC6Y1/rrhg9psXRhoXV21/+n0q6w42GCMk0wVp4z9zfeXaHOMrylsQ0bXT82kU
         5tz4YttIxGtT5x2lEc5pRZQzYTbFR+O6Kd01l2sndWdVIn9gcOYP8JpYLz4FkhmlvwI2
         XC/G+jaievb90FIGXd3HgZl3fvbL4zUOKd39kZo5J9sSEdltdjMSORFV/MOYY54Ab366
         FZ/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kq1bruee;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com. [2607:f8b0:4864:20::d42])
        by gmr-mx.google.com with ESMTPS id f3si556252qkh.5.2020.05.03.04.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2020 04:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) client-ip=2607:f8b0:4864:20::d42;
Received: by mail-io1-xd42.google.com with SMTP id z2so9360673iol.11
        for <jailhouse-dev@googlegroups.com>; Sun, 03 May 2020 04:29:12 -0700 (PDT)
X-Received: by 2002:a02:58c3:: with SMTP id f186mr10901440jab.120.1588505351182;
 Sun, 03 May 2020 04:29:11 -0700 (PDT)
MIME-Version: 1.0
From: Emilia Kudrina <emiliakudrina@gmail.com>
Date: Sun, 3 May 2020 15:28:59 +0400
Message-ID: <CABnRrYcSYkp7YjN4x6R2ZsniUC7BRUNktScao-b4rFJZcmo+FA@mail.gmail.com>
Subject: My main update
To: a.connectms@gmail.com, businessmktgpak@gmail.com, pk.cms.ms@gmail.com, 
	cms.mkte@gmail.com, cms.akyz@gmail.com, akyz.cms@gmail.com, 
	mkt.pkcms@gmail.com, mails@syeds.com.pk, cmsmarketing.pk@gmail.com, 
	mails@cms-pk.net, syedsmarketingsender@gmail.com, 
	nida.syedsmarketing@gmail.com, irajfatma@gmail.com, mishiriaz@gmail.com, 
	laibaminhaj@gmail.com, missaimanqadri@gmail.com, syedmustafamahdi@gmail.com, 
	sidrabalauch@gmail.com, mailsender@syeds.com.pk, unsubscribe.cms@gmail.com, 
	atyafpk@gmail.com
Content-Type: multipart/alternative; boundary="0000000000002e5d1405a4bcb95e"
X-Original-Sender: EmiliaKudrina@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=kq1bruee;       spf=pass
 (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d42
 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;       dmarc=pass
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

--0000000000002e5d1405a4bcb95e
Content-Type: text/plain; charset="UTF-8"

Hey, Dear Community

I started a new Youtube Channel & kindly ask you to check my videos and
subscribe to my channel, if you like it.


*Subscribe to my new channel by https://www.youtube.com
<https://www.youtube.com/c/TravelerNewsGroup?sub_confirmation=1>*


with love & best wishes, Your Emilia!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABnRrYcSYkp7YjN4x6R2ZsniUC7BRUNktScao-b4rFJZcmo%2BFA%40mail.gmail.com.

--0000000000002e5d1405a4bcb95e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"georgia, serif">Hey, Dear Community<br><br>I=
 started a new Youtube Channel &amp; kindly ask you to check my videos and =
subscribe to my channel, if you like it. <br><br><br><b><a href=3D"https://=
www.youtube.com/c/TravelerNewsGroup?sub_confirmation=3D1">Subscribe to my n=
ew channel by https://www.youtube.com</a></b></font><div><font face=3D"geor=
gia, serif"><br><br>with love &amp; best wishes, Your Emilia!</font></div><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABnRrYcSYkp7YjN4x6R2ZsniUC7BRUNktScao-b4rFJZcmo%2=
BFA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CABnRrYcSYkp7YjN4x6R2ZsniUC7BRUNktScao-b4=
rFJZcmo%2BFA%40mail.gmail.com</a>.<br />

--0000000000002e5d1405a4bcb95e--
