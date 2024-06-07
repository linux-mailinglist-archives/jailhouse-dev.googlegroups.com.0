Return-Path: <jailhouse-dev+bncBCVZDQ5D3IBBBOM6RKZQMGQER44TGXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C98FFAAD
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 06:40:27 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-dfafd98ed40sf46865276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 21:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717735226; x=1718340026; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaKe0YPYDzpWvHVDbLEdpFUDEtxBsVgh7FZ71oE3Aq0=;
        b=Gw8224lZMT/TIHVdLV81I9hmsPBJRJrsNZhKvxWhg2Yoe5sVtTPJwxrRBcZGDqS3nw
         hC/SUAFtJMJGfEsz6g0RjowZjYHSG1tHpZf46Li2PkcON9+Pn4qtSleu8LqRwA6AzFqq
         Xrfe6BiIjYahfIOQ9KYSgJR/UIxdaxBqNST51KKpd8Ua9iXb8fFnb0tBuwub5BtdTUsC
         Qnd6i2uhXdbvonKLJ6qNop+OtI2z19lXALj/1koo2mNPcXG/+Ar1ILkhCqgGeOm0gi4g
         QllvDzi2Y5f1y8bEUdqp/AWfdiiElrQdVvEzOCs8Zp6qOARAOpde5ZVrndaYhZIdqa2+
         Ta0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717735226; x=1718340026; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaKe0YPYDzpWvHVDbLEdpFUDEtxBsVgh7FZ71oE3Aq0=;
        b=NsZKW+yh1mmfq3H4ryRZSFC6piEXyJMZqq9rYmIcfJzUg2Tnbqi8Zj26D84saIOnE8
         ZTqwRD3KEscn+Dxmv6xtYNdxDwUraHfNKkCKHcT5daenirvBHlZqJOduBwI+7R16Xn65
         joW4zgIHuU+Zu3PlpA8G2Vah+Ba7yOiwsc7F1G+Zq0DLzePEMFt6ce2x3flHLC/YeJfC
         mqYgtc0r2tMfGg6NaZcU48uYI8h0VB8xpjkRC4DQS1zhtCquhGe/XTGlm4WNawoGvQGm
         dn2ceeY8D2UmkOw2lx3E2n45s+5pxbE92H/MO+DiP2f3iS7FlQWskq3AqOS9dUcAhhw2
         0XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717735226; x=1718340026;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaKe0YPYDzpWvHVDbLEdpFUDEtxBsVgh7FZ71oE3Aq0=;
        b=BIWS215K32fA7XZW2gQemsNrYpsIbMnzXWOkO0SEphjcVGmWdG6naaRHlfdWva79HI
         RVEaPuXQPpg7zS8MeTjX5HP4yi81DFog/OD9y25RIinYEh3tbGwWBPtYmkOF+Ea1ZJLd
         EL6AC7TF2O57wXe8ULSYWJcB4VaoC/ur6n3Ne2BoogaGoBUjbx/dckmkgEtSKdbbC1km
         od5E8NrZ083vRWi6+lHLBgQHEwqGYl7NzupxVPpgKO9HeC7l/scwlRJpWSSLWk3vNNj0
         /va3cnjx5bi4yuojKNgcgRcTrtIUAfgWfpwXtcvL8NtkA4d9dXW6Hj3Nj/Gfdgj8wS4t
         EEHw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVz1b+mUWhSk3W1YuCxscVhNoSHDFBR2vLkB+lKC/L9oJtNMPTMfBd4ydCGUFCecgjGk3V5JLYfZu1UvKXXKULPfSQQLsgJlMUeTSM=
X-Gm-Message-State: AOJu0YytUl0RX2GiSNFzlDFh6PFHoLaMPKt02tPhY33ypupqfB3/7mpN
	woiZKKkq3VufN5CJrLaBkNV78M3jtBzqlcBjCwo1c2pTB8l4WhqH
X-Google-Smtp-Source: AGHT+IHr1uP1r73meTezLepuP3NHeibZwj8CHHpXYGwl7hhyhz2xU/6rQjZxIRLNCeAIlI14K66KAg==
X-Received: by 2002:a25:ab2d:0:b0:dfa:fcb9:8201 with SMTP id 3f1490d57ef6-dfafcb983admr538193276.6.1717735226005;
        Thu, 06 Jun 2024 21:40:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:6b48:0:b0:df7:71d2:bccb with SMTP id 3f1490d57ef6-dfaf1659c71ls843562276.1.-pod-prod-00-us;
 Thu, 06 Jun 2024 21:40:24 -0700 (PDT)
X-Received: by 2002:a05:690c:ec2:b0:611:6f24:62b1 with SMTP id 00721157ae682-62cd44e0cedmr4889827b3.1.1717735224501;
        Thu, 06 Jun 2024 21:40:24 -0700 (PDT)
Date: Thu, 6 Jun 2024 21:40:24 -0700 (PDT)
From: Harry Conor <harryconor237@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d7f15a5a-0140-4a86-9743-0d5e136311can@googlegroups.com>
In-Reply-To: <67397328-e73b-4abf-8d19-25bb96459d58n@googlegroups.com>
References: <f4fb0b7c-dfe1-4238-9804-8042307e2764n@googlegroups.com>
 <cc24c93e-ebc3-45a1-a4c6-f0278f189437n@googlegroups.com>
 <67397328-e73b-4abf-8d19-25bb96459d58n@googlegroups.com>
Subject: Re: BUY MUSHROOM CHOCOLATE BARS ONLINE - BEST PSILOCYBIN MUSHROOMS
 CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_48344_1525798344.1717735224068"
X-Original-Sender: harryconor237@gmail.com
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

------=_Part_48344_1525798344.1717735224068
Content-Type: multipart/alternative; 
	boundary="----=_Part_48345_1096049561.1717735224068"

------=_Part_48345_1096049561.1717735224068
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Buy your psychedelic products fast and safe delivery=20
https://t.me/highlandview=20
https://t.me/highlandview=20

> =E2=9C=94US-US Delivery=20
> =E2=9C=94Fast Shipping=20
> =E2=9C=94Secure Payment Options=20
> =E2=9C=94100% Satisfaction Guaranteed=20
> =E2=9C=943 Days Refund Policy=20
> =E2=9C=94100% Money-Back if any issue with the product=20
> =E2=9C=94Shipping Service: Express/Standard/Economy=20
> =E2=9C=94Estimated Delivery Time: Express & 3-5 Days=20
> =E2=9C=94Discounts: Get up to 20% off=20

https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview
On Thursday 6 June 2024 at 11:51:32 UTC-7 Julse Ferry wrote:

> Buy all your psychedelic products with me including clone cards
> All products are available for deliveries and drop offs
> Fast shipping and delivery of packages to all locations worldwide
> Let me know with your orders
> Text me on telegram @michaelhardy33
> You can also join my channel for more products and reviews,link below
>
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
>
> You can let me know anytime with your orders
> Prices are also slightly negotiable depending on the quantity needed
>
> Call or text +12099894742 <(209)%20989-4742>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d7f15a5a-0140-4a86-9743-0d5e136311can%40googlegroups.com.

------=_Part_48345_1096049561.1717735224068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Buy your psychedelic products fast and safe delivery <br />https://t.=
me/highlandview <br />https://t.me/highlandview <br /><br />&gt; =E2=9C=94U=
S-US Delivery <br />&gt; =E2=9C=94Fast Shipping <br />&gt; =E2=9C=94Secure =
Payment Options <br />&gt; =E2=9C=94100% Satisfaction Guaranteed <br />&gt;=
 =E2=9C=943 Days Refund Policy <br />&gt; =E2=9C=94100% Money-Back if any i=
ssue with the product <br />&gt; =E2=9C=94Shipping Service: Express/Standar=
d/Economy <br />&gt; =E2=9C=94Estimated Delivery Time: Express &amp; 3-5 Da=
ys <br />&gt; =E2=9C=94Discounts: Get up to 20% off <br /><br />https://t.m=
e/highlandview <br />https://t.me/highlandview <br />https://t.me/highlandv=
iew <br />https://t.me/highlandview<br /><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Thursday 6 June 2024 at 11:51:32 UTC-7 J=
ulse Ferry wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"marg=
in: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">Buy all your psychedelic products with me including clone cards<br>All=
 products are available for deliveries and drop offs<br>Fast shipping and d=
elivery of packages to all locations worldwide<br>Let me know with your ord=
ers<br>Text me on telegram @michaelhardy33<br>You can also join my channel =
for more products and reviews,link below<br><br><a href=3D"https://t.me/psy=
chedelicfakenotes" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/psychedelicf=
akenotes&amp;source=3Dgmail&amp;ust=3D1717821612829000&amp;usg=3DAOvVaw2RN0=
Coie6RjPqwImVFgr3H">https://t.me/psychedelicfakenotes</a><br><a href=3D"htt=
ps://t.me/psychedelicfakenotes" target=3D"_blank" rel=3D"nofollow" data-saf=
eredirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/=
psychedelicfakenotes&amp;source=3Dgmail&amp;ust=3D1717821612829000&amp;usg=
=3DAOvVaw2RN0Coie6RjPqwImVFgr3H">https://t.me/psychedelicfakenotes</a><br><=
a href=3D"https://t.me/psychedelicfakenotes" target=3D"_blank" rel=3D"nofol=
low" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3D=
https://t.me/psychedelicfakenotes&amp;source=3Dgmail&amp;ust=3D171782161282=
9000&amp;usg=3DAOvVaw2RN0Coie6RjPqwImVFgr3H">https://t.me/psychedelicfakeno=
tes</a><br><a href=3D"https://t.me/psychedelicfakenotes" target=3D"_blank" =
rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den=
-GB&amp;q=3Dhttps://t.me/psychedelicfakenotes&amp;source=3Dgmail&amp;ust=3D=
1717821612829000&amp;usg=3DAOvVaw2RN0Coie6RjPqwImVFgr3H">https://t.me/psych=
edelicfakenotes</a><br><br>You can let me know anytime with your orders<br>=
Prices are also slightly negotiable depending on the quantity needed<br><br=
>Call or text <a href=3D"tel:(209)%20989-4742" value=3D"+12099894742" targe=
t=3D"_blank" rel=3D"nofollow">+12099894742</a><br><br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d7f15a5a-0140-4a86-9743-0d5e136311can%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d7f15a5a-0140-4a86-9743-0d5e136311can%40googlegroups.co=
m</a>.<br />

------=_Part_48345_1096049561.1717735224068--

------=_Part_48344_1525798344.1717735224068--
