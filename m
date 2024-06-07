Return-Path: <jailhouse-dev+bncBDTPDP6E6MLRB3G5RWZQMGQEABU6FHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 13462900D06
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 22:34:54 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dfb0aee1e18sf710342276.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717792493; x=1718397293; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IK6Wo33gNJnLPS9yZvz4IIrD50+3EBC7jSsGjAUZj4=;
        b=qpsVDtDTEh66XsVB4HrggqyN6t9nAyO0UAZgdO15rC338/ruvoujTlBSmZZhNtzjHx
         +Oj8JHTbRye0iWyMXmid7ULw7JG+igDCgOsvRWNd8oStGNczX5C1d0UAY0n4ppUf75uD
         IVDsCHMHqFOVMIxTpnX0V41sugNkZGeSCzOy7N4pnGhMq7OeiQ1xQ7ZD58XdHMmtmEcq
         KzDr5fU5AxLcJd2MugSYwHhm4OEW+yac8YsZxO5QMGbWqoxR5abvsofUFL5ygdf0EKYW
         SS9zgV6nd4r36hSrBiPfjqDi/D3kGRnpc+yyz9hjQtjjGSACiAd01UFhTMxF7jgJvIy1
         O0Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717792493; x=1718397293; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IK6Wo33gNJnLPS9yZvz4IIrD50+3EBC7jSsGjAUZj4=;
        b=mEvWiAHPriLtusv2vtTkevPBG9YO9Te4dtWYDTxmixU+sRvPPgY2HHVHzwKO3xOb7P
         1sBbAIjUR+S6A2Dtdfroah4YsBdvs+Ntuw2hmJZaZ3nMA+QXHCFvS4F5Cfj9Diu3FXmh
         nL2MeRkX86twMdcR+yAXqF1p4EEQnfRvljmloHZME5zLdao23weWLY0bngkv9z5iNm6M
         6+hd6yB0bziDjJeQ/tt5lhTYgOF5uVXyVUJ5dC38SX6xpBECUBCDoMkYFF+8+SsRj7vP
         Yb5WP+lqOzKHr1AYLuKrlhO1TJULi2BH2QxpDY3ves2QAjRr0Qq5r5zfyIrm48j5iYeM
         OZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792493; x=1718397293;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IK6Wo33gNJnLPS9yZvz4IIrD50+3EBC7jSsGjAUZj4=;
        b=SvPG77qmaeXV3aoEBvtAJW9IoDrt9kiC8C4oEykS+wsA5zaknsl5GnUhfC4fKFrBIh
         Lq36Pnrd3YUA3k3gjvMqgD6sNarz6FxVpyUUVaFgSG3kBah7iMxWwVJztBCCsutbTT/J
         YmnttGt2ZznFxxPHD0ZbwAQNOJBRoiWF2stSDbzgEh5pXeXyu/kySfwl4jHWgcseRlw2
         9Jt0Brssht7YkMGgeRTFLPcBXvAc8DdB7Z3T2Suhnl0nZFARBzqBXIxRUdgh++WGfs8V
         tp/0Xcn+PgCuYOQCU+mQl8Uhw4hQTW9r2sO3VzJ8aSCOj1XOmQr4l3gfixpXUG8mXtkf
         1K6A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVMJDBD1Avplxo+ORVgBIy5LfdLI474RkWAmIeXiuOQD/W1XBonIFgfTBPKmTufIPXRqpBTtQ/kFghWjLpVXxOnE2wxXAzxRSzpfB4=
X-Gm-Message-State: AOJu0YxIq6zsZv9D5gxjKWak107VWutzLMEVDNTc/cN6S8Mf9mTI0ggZ
	6Ear5M+pEjxvsz4SFmqqNzk+N5P1iOaOztd87MhjEy/3LgcyFi/G
X-Google-Smtp-Source: AGHT+IEL7nCfOj4svwhFbB42U5pqJijqr+pPsrK6sdpYCg1UsI9r3ut6du/88NtIsxecibvonrujrw==
X-Received: by 2002:a25:97c9:0:b0:df7:92ee:bb1a with SMTP id 3f1490d57ef6-dfaf6645822mr3610382276.52.1717792492880;
        Fri, 07 Jun 2024 13:34:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:1306:0:b0:df7:8d99:b81f with SMTP id 3f1490d57ef6-dfaf12497e2ls2244405276.0.-pod-prod-07-us;
 Fri, 07 Jun 2024 13:34:51 -0700 (PDT)
X-Received: by 2002:a05:6902:1007:b0:dfa:7282:d6d4 with SMTP id 3f1490d57ef6-dfaf64efa7dmr938906276.6.1717792491367;
        Fri, 07 Jun 2024 13:34:51 -0700 (PDT)
Date: Fri, 7 Jun 2024 13:34:50 -0700 (PDT)
From: Macurley denzy <macurleyd@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a2f1ef7f-5a4d-40e5-a34d-65f040bf10e8n@googlegroups.com>
In-Reply-To: <0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn@googlegroups.com>
References: <20386664-e1de-4554-a68e-cb40ec82036cn@googlegroups.com>
 <60398463-b922-46d6-8472-3259aa26b5d6n@googlegroups.com>
 <d5a1a6f4-91a8-462e-9750-3a0268433255n@googlegroups.com>
 <88b31542-2fed-47c2-94eb-c4d585904cc6n@googlegroups.com>
 <a40a6d9a-30b7-4bde-a22e-317a8b959309n@googlegroups.com>
 <c09dcde8-54ee-4034-84ae-8882957215c1n@googlegroups.com>
 <0cbdc9c2-c312-4ecc-a78a-2715367eaa8bn@googlegroups.com>
Subject: Re: BUY ONE UP MUSHROOM CHOCOLATE BARS ONLINE IN USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_124409_1355738693.1717792490853"
X-Original-Sender: macurleyd@gmail.com
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

------=_Part_124409_1355738693.1717792490853
Content-Type: multipart/alternative; 
	boundary="----=_Part_124410_1076777493.1717792490853"

------=_Part_124410_1076777493.1717792490853
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a2f1ef7f-5a4d-40e5-a34d-65f040bf10e8n%40googlegroups.com.

------=_Part_124410_1076777493.1717792490853
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
om/d/msgid/jailhouse-dev/a2f1ef7f-5a4d-40e5-a34d-65f040bf10e8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a2f1ef7f-5a4d-40e5-a34d-65f040bf10e8n%40googlegroups.co=
m</a>.<br />

------=_Part_124410_1076777493.1717792490853--

------=_Part_124409_1355738693.1717792490853--
