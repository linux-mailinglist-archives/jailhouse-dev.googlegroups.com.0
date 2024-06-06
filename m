Return-Path: <jailhouse-dev+bncBC33PBVJQ4BRBLUSRCZQMGQER2H6YJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091D8FF524
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 21:08:32 +0200 (CEST)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-627e4afa326sf20271987b3.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717700911; x=1718305711; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHMvu9e9ptK67VVTvnZGdU8JpzwrTydorpRuqa9orWs=;
        b=sr21kYziR9EgsSNyxw4oF2q3bC6bedX2ObLBhS/wEAiJj5bV5SAbBw9hOGHi+UvIdl
         xE+pc6tee/46Lktoq2k7Y9OLUwLmyClRJiCYdYjXXl1ZJ9fpx03FBZyL27ofsxRTO3LY
         omXNkHc57z960fydYAjAoNIKpNV293llrkPYM1B2vNViKgiFp2q5f6G2aBrsNgkb1sKb
         EXeM2Yn/wOXKeN4uqtC59mtudN2tHltizdAjb1phmMHz4KHkQu/Xn185BZqGSw3ZJNmA
         Lh56EbO+voOIe2Ph2TbW7H8BXIEOVYOvkMvxgZBqx32sDa6tiutjd1gCoXIb+St9qfPc
         dP1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717700911; x=1718305711; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHMvu9e9ptK67VVTvnZGdU8JpzwrTydorpRuqa9orWs=;
        b=OFZEAya4ZjtwF08dSfuAV7kcl6ebDURPE9V+bH3vXsiVMqqoATNIUd18hqOBenL1DU
         opGDFKuoHSTcl5/iNH1NCuPhZpLdHe3WurP3//Q5ynu3gR5fuHBZWPr6PuIAW6ZSN5cC
         LNmRy4ARxVFyC6BVupPa7Ohd3z+q5enkVmomdUOxeEjmkqAJSQxuQa6ia2h2fi4XTxwm
         1/ubjSIE5LKnsGNIU0KWQC09uyYrWeO40mZ6VN3FL6J8WQrTyR7MSNHgJy1nyXtHNeNj
         0rtf/QMnFHMwa9ubS6k1IMwZgSCybhd+36ngwcE1raCSG35J5nR7MWZdc/g6b8TEUgNQ
         29Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717700911; x=1718305711;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHMvu9e9ptK67VVTvnZGdU8JpzwrTydorpRuqa9orWs=;
        b=oCIBhNgVkFMSMdePbNEszCYl3SeLGPu6WtHjR1PGMyqjAp0XEoVgZqNpexxQ0IoyAf
         bSw+DsAufSXpm28W3vuq4ysSEEU4gUA/f+NwtammNmdOTm+onJsbtNQrLXkpHBSUlGMA
         bBdkqdvEcBW4Qdh8g3jTjqVxKx5f+c6IOHjZRS+8T+4ssAtkVR3vTWk15EK/6NxxuUqw
         GWd4YrJ95NYBy9JMMfgBMREAIAEGrFV1j1QnHRX6HSpAOK8m1ezLvxC7LVjhfjaugvOc
         L5DsH2/Iii07a5d4hqyLAVxGz7yPbOTUHoSVwDnuWBOHj+jKl07ZPzxR2vdXynngH2SO
         0MPQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUbt9/oxxaMiWvA6G86I4slblkSwJ+9et2UdcgmlH6aFLSKtO0t+yeQ4GjioR3E50ggwZzwp9Y8aJUwbPUPMshOZGGwc+LAA2ocM+I=
X-Gm-Message-State: AOJu0YypbYS6Msd45y4NGo9V4SwdvR4ghl8dpz90CViIHFASuh0eIYlF
	4WEbvqmzfN/ZSPWp93RHVH3VDqhVKDm3GvLWgJOjwmqJspt/x1D3
X-Google-Smtp-Source: AGHT+IFifCUh2XLkfZU9Kcq0Snixb9ENJpzOeZdUJUJiuVguCLQSkNWvHIKUHEK/G1xw8S9g87pdww==
X-Received: by 2002:a25:824e:0:b0:dfa:58ab:6c0c with SMTP id 3f1490d57ef6-dfaf66406a7mr270184276.36.1717700911221;
        Thu, 06 Jun 2024 12:08:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d391:0:b0:dfa:c78d:86ad with SMTP id 3f1490d57ef6-dfaf162a96dls594904276.2.-pod-prod-05-us;
 Thu, 06 Jun 2024 12:08:29 -0700 (PDT)
X-Received: by 2002:a05:690c:6786:b0:61b:eca6:88f0 with SMTP id 00721157ae682-62cd558c2d2mr649477b3.2.1717700909438;
        Thu, 06 Jun 2024 12:08:29 -0700 (PDT)
Date: Thu, 6 Jun 2024 12:08:28 -0700 (PDT)
From: Julse Ferry <ferryjulse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e7a4b165-676f-487b-a381-86d1e32c93e0n@googlegroups.com>
In-Reply-To: <a28671d8-e460-4695-8337-c1a386105f40n@googlegroups.com>
References: <ec68a154-64a0-43d1-a5c6-e6c4ee3cf81en@googlegroups.com>
 <a28671d8-e460-4695-8337-c1a386105f40n@googlegroups.com>
Subject: Re: $ORDER DMT VAPES, CARTRIDGES WITH POWDER ONLINE CALIFORNIA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_112068_401325508.1717700908955"
X-Original-Sender: ferryjulse@gmail.com
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

------=_Part_112068_401325508.1717700908955
Content-Type: multipart/alternative; 
	boundary="----=_Part_112069_436225772.1717700908955"

------=_Part_112069_436225772.1717700908955
Content-Type: text/plain; charset="UTF-8"

Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide
Let me know with your orders
Text me on telegram @michaelhardy33
You can also join my channel for more products and reviews,link below

https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes

You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

Call or text +12099894742

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e7a4b165-676f-487b-a381-86d1e32c93e0n%40googlegroups.com.

------=_Part_112069_436225772.1717700908955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards<br />All pr=
oducts are available for deliveries and drop offs<br />Fast shipping and de=
livery of packages to all locations worldwide<br />Let me know with your or=
ders<br />Text me on telegram @michaelhardy33<br />You can also join my cha=
nnel for more products and reviews,link below<br /><br />https://t.me/psych=
edelicfakenotes<br />https://t.me/psychedelicfakenotes<br />https://t.me/ps=
ychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br /><br />You ca=
n let me know anytime with your orders<br />Prices are also slightly negoti=
able depending on the quantity needed<br /><br />Call or text +12099894742<=
br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e7a4b165-676f-487b-a381-86d1e32c93e0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e7a4b165-676f-487b-a381-86d1e32c93e0n%40googlegroups.co=
m</a>.<br />

------=_Part_112069_436225772.1717700908955--

------=_Part_112068_401325508.1717700908955--
