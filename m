Return-Path: <jailhouse-dev+bncBCHKZ6U5VMPBBIM54T4QKGQEERYYTYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id BB572245739
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 12:46:58 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id j8sf9085861qvu.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 03:46:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597574817; cv=pass;
        d=google.com; s=arc-20160816;
        b=0nvRn/U9172pTsYf+O0ZICXYUzN5HUOlqm+a/kbpXIZ4EhlYDH/cbHDOX0Bmilikix
         HqiOZ7kNo2ubQDEKLsiVfrDSdwQsR7wUXji9Xaak+fYMgu+sl9oDVRnkQxI7+gnZzSSe
         2Px35ktfDtA2IPccCepA25qEbNEUwyllaEvpfre46/b7UDMAF+i2q0sQYNZQp0jIafP4
         nAinoXr0gasRLLVI0LbCuGWC0hHoS2hSNm7YA43o+rqPoU6TLSWmwOe2YYWpzxhmLD1/
         qb/KdRXfm8cwRoNHoAUeYFqkFSlKVDE70rwtWXNW+cTj4hleTGE5YHmHgzMeMcY/8m7O
         a3oA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=KtNExS95Y9lm4XmsNmKcQ6VXLax7p8HVlY/6p/Yzklk=;
        b=TYYPhfsS5Tysd1zr5XVvC1b0S6eZTUHL5adev3JuGM4V14H1TAJj5f/oS1kUd+Id6U
         gOLI5AgpEVdhssFu/Os6NDPEfeZp5NtiDXzqiZXS6Hs8492+JXs1A+Cc2Snv0hjo+n/x
         XWQYt4/vre8Fg3OqvTuQ16m0yuc418xe+GM6GpHo2Vzht+9N5LFKIUODIh5OqLC4e/KK
         PvFiqdUVzbPUxGvHfOC0Cbi5+99TYERB+QpI2hWeUGSl5Vc5m7X1vYhUdpQF8pKebxyk
         5h81zcnfxKb3SEye2bVy47Q+ZzzD8d0ABnKRq07k+dKkg3Mvk5l3vCBrDRZ5Abt6dN8p
         dCig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="myf+Pa/X";
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KtNExS95Y9lm4XmsNmKcQ6VXLax7p8HVlY/6p/Yzklk=;
        b=FrPCBPpOQsgJM1oPS/7bwm5v4foVx0b29iWXoBxbyQYQX1J33Oh1bnhFC6cLBEQyRd
         k4t2wMOBLdkvXOm6sQrPfMZD2O7csIdP17lOKOktQZdlkRxSa8B6rRQdL2iGWxdX3nru
         Tn7ddbFaUFK0uNRqwaisMv9Yv4AUsPbHB9xgUCqpLHDe3YumQjSVmNrmG20CrJDj2qo4
         vFAfYkn0BUt4+fvzWxUHDOYeAQ/cF6sknY6fFm3QowGDRL45JCMAmRjDcP6iqb7gttEq
         gfteNQJE2Kpak1kTs7XM5CxqI5djDaJaocrJh8sCAYT/DR+naIOQ6GULq2upjTDuVvwg
         Ht+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KtNExS95Y9lm4XmsNmKcQ6VXLax7p8HVlY/6p/Yzklk=;
        b=G9whEKi/vBcqga7jaevANdOPhorqWrBhQBtoHsQlKZR8ol7AZyrJ5SjkzxB1cLCFms
         CVO8HafHaMVvP2F96CviBAIMTgvkoC3UH9dzlXTH/MTBzwr7GUVRpqbFza1pIRhkS4Fu
         Orr5tXaEZXCi6l57xmZz4c3LLkn6CSdsBUHVnqNVb0qC9g0fI4QZh2NplhaFBSYBRBK9
         D1v4ZnjhXuue3LzBCjviieOmMxxn1L+Q9lwHwv2hBnjnZO7u7TeVcGZbzaL6oCoVIS/g
         VSrEJycNsL6R6tLsnb4hcMqPyulTZDpmd5BawEIOijrDRRXgehlPJ7uAbzhHWxBu/mQ9
         WOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KtNExS95Y9lm4XmsNmKcQ6VXLax7p8HVlY/6p/Yzklk=;
        b=fSFfvRVLf/fZKAkPK+9g1OZ9KeG30wBjh8lDvnK8ZmHt/MwUAkfAeqkdECSBAJaLsR
         Z7JutXJbZzoteYdYcr6Yf3PYjq/9DUjlXbUdN79/Kyb0NOYt+3PZLq1T3PBxmlp8MCcg
         m8nqpoWdlIL0B/vLWtCcGyGgDB+qOGPFX7inu+/kxeKUh81BhnO+3ZC01UsyvTi4cmKk
         hkM8fCPdusNZscvb3lVNWgjf6hve9jIZsFg10cGDKbqnkp6s6begJCEOM8TKW4ouxAbX
         YaPS+lnbJ+vRmHqFg4YHI+PpN8Kr9RYVmVR2v7CN6PbLxNvox5exVA+dvUoctmUloTcQ
         U3fA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Wqzm8dLdZ/V0YJYUzZVo6B/EmJAKgoSSKnswd87NLNzNnmeYT
	fe3NYfuVGmidkRb9J33pvcU=
X-Google-Smtp-Source: ABdhPJz9gkYAMaFvm7NFXpwn2lulr8rGc1tDGfebDzU9Wlea8W2/2jVBhR+r7r6dX+SjPIhjH7f+ew==
X-Received: by 2002:a05:620a:2230:: with SMTP id n16mr9099344qkh.268.1597574817787;
        Sun, 16 Aug 2020 03:46:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:246b:: with SMTP id s40ls5384674qtc.5.gmail; Sun, 16 Aug
 2020 03:46:57 -0700 (PDT)
X-Received: by 2002:ac8:3772:: with SMTP id p47mr9236444qtb.355.1597574817377;
        Sun, 16 Aug 2020 03:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597574817; cv=none;
        d=google.com; s=arc-20160816;
        b=wB2ae8XYO2e9XaxcDuA3q8a73j5F2rMHWDEnnkOtidSJy+Ee0SrlQCGaGa5dJrpbyS
         RuQZOf5Unt0mfTY9hc111cE8jRk027CG+AzmCKIZUroYnxAQ1vMD2PEAfn0Ow5K7IX6Z
         GoG9FaANS5XY/NOTkcaQ/hQQWoh9aLaonu2IyoFL5hcsg6C2xDCUGiR3PhJ2WVgL0azr
         bDdbvuaTEH5BlerX7JyxP8lbSe3OZQ9AHugdmawmY9NbVd86A6g/Fj6zWgMEQh4FUmDL
         AXbWgymzXjXffFIVfuf5rOMGGJBMZdTDSKxxZiwm1qvN8k21D6bc6IYuav881mUkpKQk
         ynuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gjDplsG6tjkuhrc/ezhYoy+2a830qjzBN+Dk2ixbkbo=;
        b=i7Px74hGgsi51Xdv4zdINQhD7aHnvr66FnmLJbSWW8AuwlCv9q5qZKHTcll0wjfzNu
         o6JEveACZcDCA3tlv5u78g8+7tWdMjE9qxCZXbPG1LdGUcDDVZRJKIJ7Bx2cabG+r/GP
         GDMNgNU2sV825cbLH2ELzdWQ87xZyQ/K6ZxpGp7YqQsA4fESNqqTZaYg3WcFUHYKHWUe
         cvVCLraudO8z5B9cBbInfkO4YwHfp94kXDZttluJEKPV0+bNeaUxSlAmoEDBg3+OWnJs
         HgypGJ0LvSSv4fryE3P2tvoNNxazMYxZP5p3LrJHrcdX83STEv4ZXAPUYRptVMzRX4+K
         yKKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="myf+Pa/X";
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com. [2607:f8b0:4864:20::142])
        by gmr-mx.google.com with ESMTPS id o24si830107qki.7.2020.08.16.03.46.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 03:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) client-ip=2607:f8b0:4864:20::142;
Received: by mail-il1-x142.google.com with SMTP id t13so12053076ile.9
        for <jailhouse-dev@googlegroups.com>; Sun, 16 Aug 2020 03:46:57 -0700 (PDT)
X-Received: by 2002:a92:d688:: with SMTP id p8mr3251926iln.82.1597574816924;
 Sun, 16 Aug 2020 03:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200816090417.439483E8B0@qw41.blogtrottr.com>
In-Reply-To: <20200816090417.439483E8B0@qw41.blogtrottr.com>
From: Emilia Kudrina <emiliakudrina@gmail.com>
Date: Sun, 16 Aug 2020 12:46:45 +0200
Message-ID: <CABnRrYecOx2JkLQAoRewvddSu-MSXdpCxW0g3c9akB0F9FPsAg@mail.gmail.com>
Subject: =?UTF-8?Q?Fwd=3A_TravelerNews_Group=3A_Qov=C4=9Fadar_Hiking_=2D_Ismayill?=
	=?UTF-8?Q?i_=2D_Az=C9=99rbaycan_Respublikas=C4=B1?=
To: emiliakudrina+yahoo@gmail.com
Content-Type: multipart/alternative; boundary="000000000000770d9c05acfc5f60"
X-Original-Sender: EmiliaKudrina@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="myf+Pa/X";       spf=pass
 (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::142
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

--000000000000770d9c05acfc5f60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[image: thumbnail]Qov=C4=9Fadar Hiking - Ismayilli - Az=C9=99rbaycan Respub=
likas=C4=B1
<http://feedproxy.google.com/~r/TravelernewsGroupVIDEO/~3/OL1knRRePak/watch=
>
Aug 16th 2020, 08:00, by TravelerNews Group
<https://www.youtube.com/channel/UCCu7MRjMBJC-9VJzR6nPf-A>

Media files:
Qov=C4=9Fadar Hiking - Ismayilli - Az=C9=99rbaycan Respublikas=C4=B1
<https://www.youtube.com/v/ITWNxp4DyKM?version=3D3>
(application/x-shockwave-flash)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABnRrYecOx2JkLQAoRewvddSu-MSXdpCxW0g3c9akB0F9FPsAg%40mail.gm=
ail.com.

--000000000000770d9c05acfc5f60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div style=3D"margin-left:4px;m=
argin-right:4px;margin-top:0;padding:0;font:13px Helvetica,sans-serif"><tab=
le width=3D"100%"><tbody><tr><td style=3D"line-height:10px;font-size:6px;pa=
dding-left:1px;padding-right:1px"><br></td></tr>
<tr><td>
<a name=3D"m_3290560010611425_item_0"></a><table class=3D"m_329056001061142=
5btrcontent" cellpadding=3D"3" width=3D"100%" style=3D"font:13px Helvetica,=
sans-serif;border-radius:4px;background-color:#fff;padding:8px;margin-botto=
m:6px;border:1px solid #adadad"><tbody><tr><td>
<img style=3D"max-width:80px;height:auto;margin-left:10px" align=3D"right" =
src=3D"https://i2.ytimg.com/vi/ITWNxp4DyKM/hqdefault.jpg" alt=3D"thumbnail"=
><a style=3D"font-family:Helvetica,sans-serif;letter-spacing:-1px;margin:0;=
padding:0 0 2px;font-weight:bold;font-size:19px;line-height:20px;color:#222=
" href=3D"http://feedproxy.google.com/~r/TravelernewsGroupVIDEO/~3/OL1knRRe=
Pak/watch" target=3D"_blank">Qov=C4=9Fadar Hiking - Ismayilli - Az=C9=99rba=
ycan Respublikas=C4=B1</a><div style=3D"font-family:Helvetica,sans-serif;te=
xt-align:left;color:#999;font-size:11px;font-weight:bold;line-height:15px">=
Aug 16th 2020, 08:00, by <a style=3D"color:#999" href=3D"https://www.youtub=
e.com/channel/UCCu7MRjMBJC-9VJzR6nPf-A" target=3D"_blank">TravelerNews Grou=
p</a>
</div>
<div style=3D"font-family:Helvetica,sans-serif;color:#494949;text-align:jus=
tify;font-size:13px"><p><img src=3D"http://feeds.feedburner.com/~r/Traveler=
newsGroupVIDEO/~4/OL1knRRePak" height=3D"1" width=3D"1" alt=3D""></p></div>
<div style=3D"text-align:left;border:1px solid #adadad;background-color:#f6=
f6f6;color:#666;padding:8px;border-radius:4px;line-height:16px;margin-botto=
m:6px">
Media files:<br>
<a href=3D"https://www.youtube.com/v/ITWNxp4DyKM?version=3D3" target=3D"_bl=
ank">
Qov=C4=9Fadar Hiking - Ismayilli - Az=C9=99rbaycan Respublikas=C4=B1</a>
(application/x-shockwave-flash)
<br>
</div>
</td></tr></tbody></table>
<img src=3D"https://blogtrottr.com/spot/7h0T/3/cvP7" alt=3D""></td></tr>
<tr><td><br></td></tr></tbody></table></div>
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABnRrYecOx2JkLQAoRewvddSu-MSXdpCxW0g3c9akB0F9FPsA=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CABnRrYecOx2JkLQAoRewvddSu-MSXdpCxW0g3c9akB=
0F9FPsAg%40mail.gmail.com</a>.<br />

--000000000000770d9c05acfc5f60--
