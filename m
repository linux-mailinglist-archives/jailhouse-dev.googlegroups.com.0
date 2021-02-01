Return-Path: <jailhouse-dev+bncBD5IZH4YTAFRBRVN4GAAMGQER4JW2MY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602730B060
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Feb 2021 20:30:15 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id g24sf10051041ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Feb 2021 11:30:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612207815; cv=pass;
        d=google.com; s=arc-20160816;
        b=qLZAPNCYAHSBC5edSZoURtC8Y82iudD5dQ+4NEEtfMSwIadb9Hn55FXfpEYI0gTPJH
         p2U2VnWlJMA6FUgr98d4NWtR/DMGhGDhPGNHREEvCO8tz61+0BTix+3jsLSr+twY8BKn
         2efjyD9bkbWaEiMNkIX5laN5H6BWHernhnBVzjomZfNofnX9pN0ICnfvWAKTt+GPen3R
         gdSA4dsMcv8IYcwmjim7TA5V6xgaEwrD0upG0sZi0IwIvWWsys6GllKkCF7MTZGlhVMa
         /G6pMMMlu6Y7BRj+T5FWNLykmtUvh+X2lDCnbRWOpKUjtPGibXCjrLibw1Jb5mgoqqlq
         10cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:list-unsubscribe:subject:message-id:to
         :reply-to:mime-version:from:date:sender:dkim-signature;
        bh=LtbX+uN1PKX2nPYARJwhVUjWRfDnHffzP17DsPg71fU=;
        b=efyMFZg8SULT/5V7l5BPXHl2jANPegvqYQrTrzQzyuDT4Rq83zpaeSJrtEEuDdcTy4
         X3K7h7dK8oqaihrUJ50KFo+9FnW7duqDnGuyLMoHXNVyK02lPbmyG4nKoTkehR1R8tWt
         7SX3qoExqOGSxiXHMlXLNVjPPqxI7lY+VmoTWEQ4HdVYL9RHC/tj4wOiLKQkn1eN+v6h
         VUNxxFjIPYi6G323BD+Dug0C42gs083PxJqAAMZ7WstTqCbvcukWy3ho5PFcI9CYycuH
         BKZ5ucetDVMkPvQjvfLG00Q930SE82mIjaVzER134yvzKSnMENvxHiC3eacce8T3OZl1
         3a0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@calendar.com header.s=s1 header.b=bKrzFw66;
       spf=pass (google.com: domain of bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com designates 149.72.244.74 as permitted sender) smtp.mailfrom="bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=calendar.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:mime-version:reply-to:to:message-id:subject
         :list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=LtbX+uN1PKX2nPYARJwhVUjWRfDnHffzP17DsPg71fU=;
        b=LsoRLQCFBeJY6hpi6L/kBl6Txi9iJCLjs2/7PrzfJFQvAyxbc2VrPoqQdPrVH7bx9m
         IacDDU3mhfNboKrzlvefZe6q2WJ0pseIlRxEk5M7llLLlvBx46LxwH0fI/0D2kFhHQM2
         I6yZcRy95eyBJhLLeVZPiotcu75wQI8I7ZJ2VvZttsEX1UZCo/i7a1DjTuKLDFD5avSj
         kp0DmtTRol4bpQeXaDYUpw2UIG0MW9QYE14p0EA3NNvNgGmPit0fxgH52Y1yMBgMfHsI
         AgqGPGTZcafSoV8j+sPJnmVyUVPgoragZjtmygBQefz7i0ZQmTU882gHLYd//cm7Mpe/
         5hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:mime-version:reply-to:to
         :message-id:subject:list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=LtbX+uN1PKX2nPYARJwhVUjWRfDnHffzP17DsPg71fU=;
        b=hh/U790RdgxoRsOHCTxQxd9vUyGH/LwfGwxmVAZb9stRyYqEDt30hSAbTF010aQzQV
         cavRU/iHV8mo1i9ZVHtVnCHMAvnK4hCAJhH4T5LmwdP6HKPV3Z79bbRZx4fPtnzpa32b
         o0d2n/Nap/ZxhWKnvAMO8IuXwlFoq41FYfJUz64Omvd4ypPVpBAv0fOLsIQoiqe/93XF
         hATNJ7jvtrUk1T5MbDOoy6t/UjDxfcogWzTJIzKYy04cDAA9PEFGALLzYpUWQK1nLJxS
         grSWvkzZBqqiBDbrIFNKa9aulQoCsJFvXmsVScFgYVqTRP1F6r6ltLQgWSc8cAaErAnU
         Acsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WiL6t6M5viJygwt/wgITH7QJuNv0L/Zx5+gqVByOAZkKC7Dmd
	MrkoY3rnphUyJ7xgOwH23GM=
X-Google-Smtp-Source: ABdhPJyeJNgEvgVp70/YReOY9YpFsp2q6kMeqBIHUJ22vXxWB6xsCmyrnethQ6Owx+Ndjul3Kr3A/A==
X-Received: by 2002:a19:d10:: with SMTP id 16mr9527377lfn.102.1612207814979;
        Mon, 01 Feb 2021 11:30:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls1469712lfu.3.gmail; Mon,
 01 Feb 2021 11:30:13 -0800 (PST)
X-Received: by 2002:ac2:4d47:: with SMTP id 7mr8441113lfp.58.1612207813704;
        Mon, 01 Feb 2021 11:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612207813; cv=none;
        d=google.com; s=arc-20160816;
        b=xIqXOhVafqied208xXly3s+AXa6n60snPEHimxMvwhPaGvPoc7tsGAeLQjHG+QUqS7
         YmVWZZfKVH2J+mI2Kya2NR3UHuwMWwRy2PaCBb8dhLykj3obVXuV1jTzdzXI5eIpqOg5
         Pm9VfVlTE9fwWiQDkUO1/NlqvKzeCa9Wr4zhD7Mg/cZvUs/RPTZ4n6GadH90urMyNGfz
         FHmyYC2BeGqeHOk97PPUp1iR6wm5CVnDxuj4/5dhlCwoDtXTeVjVzLkRTFVFAzhnMFSU
         bY2BhaWRTP5NEozhnk0tb8uu5wBuNTpHt9DoYoEQgrj9Hrvp6v4vbaJDu4aBCyHuht1R
         xAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:subject:message-id:to:reply-to:mime-version:from
         :date:dkim-signature;
        bh=e6xqWS33dQC6qbBnwWPK+HzTjGH6xT8K8/plsYVHBqE=;
        b=LY6PxEE1zbpaTMdD9FvSvo9OYM7c5Yf8ItF7lvcZq99rohk2QFRPDytR8MhktfXcNi
         1OXlBO/hM0TFoe+HZm4g2pJbnStv7DK4HOfycb2gD5wlTpuL4kfj4MXgbqj8UPZnPDCF
         5vjiLMZhOqsbS2V5lNO/OUjHqeVJc9E1reyzCtrRXu7pwAVNQa0ZZx+Wdv1yaXiRcJDQ
         QDk8kdaTwSAQNOwGcNKk12WVdZLMAAB/0Qn5r9bcQb+4XVkBcU9TtDyBfwnFmTrP8AGU
         xRCfjXEgt6kraDYN5gEYzEBfLsdXwIJ2BPfKMEItvVOVcI42XpiujpDhleN1EjMIJQz3
         ZP9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@calendar.com header.s=s1 header.b=bKrzFw66;
       spf=pass (google.com: domain of bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com designates 149.72.244.74 as permitted sender) smtp.mailfrom="bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=calendar.com
Received: from o2.ptr176.calendar.com (o2.ptr176.calendar.com. [149.72.244.74])
        by gmr-mx.google.com with ESMTPS id 13si227413lfe.12.2021.02.01.11.30.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2021 11:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com designates 149.72.244.74 as permitted sender) client-ip=149.72.244.74;
Received: by filter2236p1las1.sendgrid.net with SMTP id filter2236p1las1-22955-60185163-10
        2021-02-01 19:07:15.655310679 +0000 UTC m=+121898.500708404
Received: from ODA3ODgwNg (unknown)
	by ismtpd0095p1iad2.sendgrid.net (SG) with HTTP id ZJqa6ZWkQhut_vghNtB-vA
	Mon, 01 Feb 2021 19:07:15.551 +0000 (UTC)
Content-Type: multipart/alternative; boundary=8d53a5d0d9ddbc0d841ba905c55bd865637118901e02f58aaf8abde50407
Date: Mon, 01 Feb 2021 19:07:19 +0000 (UTC)
From: "Nik Fowler" <nik@calendar.com>
Mime-Version: 1.0
Reply-To: nik@calendar.com
To: jailhouse-dev@googlegroups.com
Message-ID: <ZJqa6ZWkQhut_vghNtB-vA@ismtpd0095p1iad2.sendgrid.net>
Subject: Before you schedule one more meeting, read this
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mGGJyH5G29Mi18A
 mejcVqdG12ljJPgZFeP8ew3dXvIQSPJUNS7ymQJMEVeb+Fs+En4k6Uoc/1haZSwLJK66YhtlbFXu09
 YdR3QEsKwakaL3q9oiH10WdfNc0GKKfJoN/gwg46Z72aVwvNCOPMM2n7Rxa4FoKpuF887rFinQoBwI
 c=
X-SG-ID: mcTyqcYTtmn56LU3ATD1f92dpf3KDUKYmD4CXZ9dnKjBL/+dwbc2j+RmQnEq+uxoQqhOFxAEiVw39b
 W+HKwr2gELsQSoU+quGaJu70w3UmKebAejhbtaV+pl+mb1IlkKupy9nfx7kpQpIr0Z9QbXt2J0pI8U
 tVjBIl5kCIASArKMxz/2cfbkjB72jfuJF3hU9kd/A+E1+3rRonH8ydPK1mLUh+/shEExstN+pAsCMs
 psE8F1nst6oYhOsZBnafXRwfGdRFTRsY1sXdH+g00tyyVHpbgc4TVY76pFMYQFzT1V+dAO7fSEp3j1
 +cFhK4pMjAGfPSKM+NYeY0h1aTcIBj+kk20ngpTt68E21P1gYlYRD1i++wQo8zRBZwyJ5lSF4hkv4z
 AZwasE89Jjy+q9hQlnoe0kmdR8uYSzJXs0uwjTGA5ltmNm9WgglnAYedmveZtS2OFwTDJdMbsAxEge
 qoI+iDYYVeYN2dyDqbntbMSXZGmPylOrycyL+Sya/1LfMUG8RH7ESD8K+F9PwKPQsQCbZLVzD0Is/q
 xPF+x8/Zyj0mac3AAogS4Px0381JV4aJhqw11O0joUnk50wyVbQ2zEXn++tDSn1FdjymObPGUEPtD3
 CEhPi7Hl2rGYDWK/BfUngizYeWC0+0kUH30gc+RP7flBGMZMlSTdybsYfqRxu6gnC/VxwnPuVp8NDF
 iU
X-Entity-ID: Bt5nB1dbkMVinmmnE1uV3w==
X-Original-Sender: nik@calendar.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@calendar.com header.s=s1 header.b=bKrzFw66;       spf=pass
 (google.com: domain of bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com
 designates 149.72.244.74 as permitted sender) smtp.mailfrom="bounces+8078806-f17a-jailhouse-dev=googlegroups.com@em8269.calendar.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=calendar.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--8d53a5d0d9ddbc0d841ba905c55bd865637118901e02f58aaf8abde50407
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Be more productive

( https://calendar.com )

Hey this is Nik Fowler, hope all is well! I am reaching out to efficiency-m=
inded people to introduce the next evolution in efficient scheduling and ca=
lendar management.

****************
Unified Calendar
****************

No matter where your calendars may have originated from, Calendar brings th=
em all into one place making it easy to see what is coming up in your busy =
life and allowing you to be as productive and efficient as possible.

******************
Calendar Analytics
******************

The analytic features will allow you to see where you are spending your tim=
e so you can adjust to become more efficient and time-aware than ever befor=
e.

*******************
Find a Time to Meet
*******************

Calendar's find a time feature allows you to compare your team's schedules =
to find a time that works for everyone and eliminates the time-wasting back=
 and forth emails trying to find a time that works for everyone.

*********************
Scheduling Time Slots
*********************

With Calendar's customizable scheduling links, anyone can sign up on your o=
r your team=E2=80=99s calendar and choose a time that works for everyone, m=
aking scheduling with external people a breeze.

Calendar is the answer to all your time-wasting scheduling headaches and is=
 available at the best price because a world where everyone is efficient an=
d organized is a better world for everyone!

*Visit Calendar.com ( https://calendar.com ) to start your 30-day free tria=
l*

Be More Productive. Save Time. Focus.
Join Calendar for free today. ( https://calendar.com )

=C2=A9 2021 Calendar.=C2=ADcom
support@calendar.com

Unsubscribe ( http://url9539.calendar.com/wf/unsubscribe?upn=3DVU2koNEWgSKM=
LPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-2B1Io8=
-2BjTZz5LGhyF-2FDrYTzigOGR-2F-2BA9EChTdFDj7-2BFSIu4taSaBGHR8jv2WbbNfbrD5QBc=
mCtPtwb5hD-2FJtKtkbSr3cgulhdBf6HkC5nutjNudJhmGNmArh68oQWaXKsFVUo5oNoENgPU0J=
Y8FbtXlqW0jo7t1gJ8yGM7SiBtIB5LHyjcHz6ITN8BR700QcZkkHmWbi5HdIies-2F-2BJcAnI8=
B8YsOkdlT9uZ4UZihjqVYe7uKPZhMewD6-2BfHmov0HDT1pgXmrlSI595je8jKbZl0JAzgf0vV7=
RKpPiPg5mzJEMagdjtgCgU-2FNqLpcMV-2BGIdtirgbWArS5GXoNYIQvgRLCWSUyhXjWwZqvSiX=
RGcg46MKQeXsFqibJdQQZG8uiMgDJygmjIPIqJCbJ5rgM3MMiHFf7NsbKCX1CacqZ6xbmb3jY47=
hIA57zbhtqy-2BWb3szQQf17YRfPI8R0D4OAcXqWWMsxUjb9XscfgmWaTScZVUQLjJSAwftgpav=
U08DypiN4xzTVKI1Y5MywUv6STk8xPyr-2FuKD88KWkbBu-2FgCuKMTESfFxxTNJmG2NCOetvTn=
Cr2EOtvrd-2FOtS-2FfPD8IIA-2BAZS4bQGW4Ncl-2FVL6D9yYm5AtFs-2FXue1xzDWS89r98cO=
reBVKq81JzmJkICUbyny44WUP3UCKgQbtHaFenUJLNAIttj0T-2FnpWBk-2FxMm2ZAokKn1ZPqg=
xrML4-2FEz4TNSr45vlQsQzgP34A2nbfJ9OS4AWgk5Tqtv6Ce-2BCj7Ffpo5HE2nLNAkzOHcyId=
nkH0G1LXVU89Ah605O1QaGn1-2BzrTnaUyxDGe9HodtoCO3q0duXAMJJ-2FMGCnxUaI5lhN6yqM=
7L3VsCKdGs-3D )

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ZJqa6ZWkQhut_vghNtB-vA%40ismtpd0095p1iad2.sendgrid.net.

--8d53a5d0d9ddbc0d841ba905c55bd865637118901e02f58aaf8abde50407
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html>
<html>

<head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0"/>
  <meta name=3D"x-apple-disable-message-reformatting"/>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/=
>
  <meta name=3D"color-scheme" content=3D"light dark"/>
  <meta name=3D"supported-color-schemes" content=3D"light dark"/>
  <link href=3D"https://fonts.googleapis.com/css?family=3DOpen+Sans:400,700=
,800&display=3Dswap"
        rel=3D"stylesheet" type=3D"text/css">
  <title>Be more productive</title>

  <style type=3D"text/css" rel=3D"stylesheet" media=3D"all">

    /* calendar colors for reference only -- note css variables are not sup=
ported by IE. */
    /* https://developer.mozilla.org/en-US/docs/Web/CSS/var */
    :root {
      --color-calendar: #587CCB;
      --color-black: #2E2E2E; /* main font */
      --color-red: #FC5959;
      --color-green: #AEE54F;
      --color-yellow: #FED675;
      --color-gray: #ADB0B9; /* secondary light gray */
      --color-anchor: #3869D4;

      /* light dark variables */
      color-scheme: light dark;
      supported-color-schemes: light dark;
    }

    /* Base ------------------------------ */
    body {
      width: 100% !important;
      height: 100%;
      margin: 0;
      -webkit-text-size-adjust: none;
    }

    a {
      color: #3869D4;
    }

    a img {
      border: none;
    }

    td {
      word-break: break-word;
    }

    .preheader {
      display: none !important;
      visibility: hidden;
      mso-hide: all;
      font-size: 1px;
      line-height: 1px;
      max-height: 0;
      max-width: 0;
      opacity: 0;
      overflow: hidden;
    }

    /* Type and font sizes ------------------- */
    /* roboto is the fallback for gmail */
    body,
    td,
    th {
      font-family: "Open Sans", "Roboto", Verdana, Tahoma, Arial, sans-seri=
f;
    }

    h1 {
      margin-top: 0;
      color: #2E2E2E;
      font-size: 32px;
      font-weight: normal;
      line-height: 1.4;
    }

    h2 {
      margin-top: 0;
      color: #2E2E2E;
      font-size: 22px;
      font-weight: normal;
      line-height: 1.4;
    }

    h3 {
      margin-top: 0;
      color: #2E2E2E;
      font-size: 18px;
      font-weight: normal;
      line-height: 1.5;
    }

    td,
    th {
      font-size: 18px;
      line-height: 1.6;
    }

    p,
    ul,
    ol,
    blockquote {
      margin: .4em 0 1.2em;
      font-size: 18px;
      line-height: 1.6;
    }

    /* sub */
    .small-gray {
      color: #AFB5C4 !important;
      font-size: 13px !important;
      text-decoration: none !important;
    }

    /* reduce font size on smaller screens */
    @media only screen and (max-width: 500px) {
      h1 {
        font-size: 20px !important;
      }

      h2 {
        font-size: 17px !important;
      }

      h3 {
        font-size: 15px !important;
      }

      td,
      th {
        font-size: 14px !important;
      }

      p,
      ul,
      ol,
      blockquote {
        font-size: 15px !important;
      }
    }

    /* core ------------------------------ */
    body {
      background-color: #F2F4F6;
      color: #51545E;
    }

    p {
      color: #51545E;
    }

    .email-wrapper {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #F5F5F5; /* window background light mode */
    }

    .email-content {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }

    /* Masthead ----------------------- */
    .email-masthead {
      margin: 0 auto;
      padding: 25px 0;
      text-align: center;
    }

    /* Body ------------------------------ */
    .email-body {
      width: 100%;
      margin: 0;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }

    .email-body-inner {
      width: 600px;
      margin: 0 auto;
      padding: 0;
      -premailer-width: 600px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      background-color: #FFF;
    }

    /* main padding */
    .body-action {
      width: 100%;
      margin: 10px auto;
      padding: 0;
      -premailer-width: 100%;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
    }

    @media only screen and (max-width: 640px) {
      .email-body-inner,
      .email-footer {
        width: 100% !important;
      }
    }

    /* Footer ----------------------- */
    .email-footer {
      width: 600px;
      margin: 0 auto;
      padding: 25px;
      -premailer-width: 600px;
      -premailer-cellpadding: 0;
      -premailer-cellspacing: 0;
      text-align: center;
    }

    .email-footer p {
      color: #ADB0B9;
    }

    /* Buttons ------------------------------ */
    .button {
      color: #FEFEFE;
      -webkit-text-size-adjust: none;
    }

    @media only screen and (max-width: 500px) {
      .button {
        width: 100% !important;
        text-align: center !important;
        font-size: 12px !important;
      }
    }

    /* Event table ------------------------------ */
    .event-item-val {
      font-weight: normal;
    }

    /* Light Mode Image ------------------------------ */
    .light-img {
      display: block;
      text-align: left !important;
      width: auto;
      overflow: visible;
      float: none;
      visibility: inherit;
      max-height: inherit;
      max-width: inherit;
    }

    /* DARK MODE ------------------------------ */
    @media (prefers-color-scheme: dark) {

      /* show dark mode logo */
      .dark-img {
        display: block !important;
        text-align: left !important;
        width: auto !important;
        overflow: visible !important;
        float: none !important;
        visibility: inherit !important;
        max-height: inherit !important;
        max-width: inherit !important;
      }

      /* Hides light mode logo */
      .light-img {
        display: none !important;
      }

      .email-body,
      .email-masthead,
      .email-footer,
      .email-content,
      .email-wrapper {
        background-color: #0A0C0E !important; /* window background light mo=
de */
      }

      .email-body-inner,
      body {
        color: #DFDFDF !important;
        background-color: #15191c !important;
      }

      p,
      ul,
      ol,
      blockquote,
      h1,
      h2,
      h3 {
        color: #c8c8c8 !important;
      }
    }
  </style>

  <!-- font stack for outlook -->
  <!--[if mso]>
  <style type=3D"text/css">
    .fallback-font {
      font-family: Verdana, Tahoma, Arial, sans-serif !important;
    }
  </style>
  <![endif]-->

  <!-- bullet list fix for outlook -->
  <!--[if lte mso 16]>
  <style type=3D"text/css">
    li {
      text-align: -webkit-match-parent;
      display: list-item;
      text-indent: -1em;
    }

    ul, ol {
      margin-left: 30px !important;
    }
  </style>
  <![endif]-->
</head>

<body>
<span class=3D"preheader">Be more productive</span>
<table class=3D"email-wrapper" width=3D"100%" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation">
  <tr>
    <td align=3D"center">
      <table class=3D"email-content" width=3D"100%" cellpadding=3D"0" cells=
pacing=3D"0" role=3D"presentation">

        <!-- Masthead/Logo -->
        <tr>
          <td class=3D"email-masthead">
          </td>
        </tr>

        <!-- Body -->
        <tr>
          <td class=3D"email-body" width=3D"600" cellpadding=3D"0" cellspac=
ing=3D"0">
            <table class=3D"email-body-inner" width=3D"600" align=3D"center=
" cellpadding=3D"0" cellspacing=3D"0"
                   role=3D"presentation">
              <!-- Body content -->
              <tr>
                <td style=3D"padding-left:45px; padding-right:45px; padding=
-top:45px; padding-bottom:25px;">
                  <div class=3D"fallback-font">

                    <!-- MAIN LOGO -->
                    <a href=3D"http://url9539.calendar.com/ls/click?upn=3Da=
a4TH9t09kvpm62FQweLsD3woqUXRbKEZE-2BsoN0isCA-3DpWmm_yxe3hxlEKZLb36qs-2BKApV=
r7ZX4aFxpSJbhjNkBlCEPRTGIvXkRptALDz9gXFwao8y4ItIgChaVYo7bx3VpP-2F5TBD3258BS=
COvCEIvSzBivjLXKbip2HKcTbaJjmMxAV02Tz6GEEKHjfTBFqwhyRXDUehQZkz9DyJQVXupM0Ig=
6BPkGH-2BjetccYKJi-2B5MkRy-2Fkz2OTAQd2b5CO8OP32fCYM1jBMKtv-2FNb-2BqM5tRMj7x=
M5XwEdzpuSpiC1T9arSKFt2ajGI-2FXh2XPt8JMplkfgB6wtf7EKfMphzb3xrFsu55sNL1eBRph=
3giBXKYgvg1CxGF5lgQXn-2BVVz0Inpuya9YFXVjLCgtxPKubwei1oF-2FJbtm1lSfUUZwIxLc9=
ZEptlu4yIlyQyVQv10gJjxk05rEbtWI5FbCDrDjESmPmJ8WRHHm0IvI7rCHt-2Fag9bInNs3Cmx=
tGPldOPopQqs9I1Q5oaexN0oaPi9M5ocvIz6LkT7cljOv54JHFWK0-2B9t0q2OHMq078rGZ1Eq6=
3nzaRQAby4FVHjO1YNvvkGRI-2FCgPE4dEZMw2IoAt1qU1dmgaRSMdeURdIspuMpUxoaqP3U4xz=
jQIRHZ4HhzVbfIquPu006JJ7bVPsyUw5QcXEsKRGxokJ10nXkpAmbKplzBZA9mNz8yp97Ix1sLN=
2J6FLC2yTm-2F9oX2PTZC-2Bk290ep405S38Uu6pQdWnX45HPyicQ72BOGXYntDsHjSpIQtC2Q6=
7Cwiig4V74g6TRbVctEOvUBhtIfNKf-2FPCyVgzV4ramz-2ByhI3M5leLhRD-2FUoYHeHI79O8X=
k5rixqA-2B5NG3HRG-2Bz3lsysitWqGqrKOKR5PPqyObMLE7YzlsVnnwsRMc16eiJnvUVbnkeqt=
erMmEL4nphTMq-2Fr4zNnfpJMX8GTN6ygHj7LMV9QObMieNIBhMhIF7-2FYs-3D" target=3D"=
_blank">
                      <div class=3D"light-img">
                        <img alt=3D"Calendar.com"
                             src=3D"http://cdn.mcauto-images-production.sen=
dgrid.net/453850d1ef435f28/95d30ad6-0a8b-4e97-aac4-1db581663459/234x64.png"
                             style=3D"color: #33373E; text-align:left; font=
-weight:bold; font-size:32px; line-height:1.4;
                             text-decoration: none; margin: 0 auto; padding=
: 0;"
                             border=3D"0"/>
                      </div>

                      <!-- The following Dark Mode logo image is hidden wit=
h MSO conditional
                      code and inline CSS, but will be revealed once Dark M=
ode is triggered -->
                      <!--[if !mso]><! -->
                      <div class=3D"dark-img"
                           style=3D"display:none; overflow:hidden; float:le=
ft; width:0px; max-height:0px; max-width:0px;
                           line-height:0px; visibility:hidden;">
                        <img alt=3D"Calendar.com"
                             src=3D" http://cdn.mcauto-images-production.se=
ndgrid.net/453850d1ef435f28/74106581-e00a-46f6-a2b6-e82a483a8a91/234x64.png=
"
                             style=3D"color: #ffffff; text-align:left; font=
-weight:bold; font-size:32px; line-height:1.4;
                             text-decoration: none; margin: 0 auto; padding=
: 0;"
                             border=3D"0"/>
                      </div>
                      <!--<![endif]-->
                    </a>

                    <!-- ALL BODY CONTENT STARTS HERE -->

                    <!-- hello -->
                    <p class=3D"fallback-font"
                       style=3D"padding-top:10px; text-decoration:none;">
                      Hey this is Nik Fowler, hope all is well! I am reachi=
ng out to efficiency-minded people to
                      introduce the next evolution in efficient scheduling =
and calendar management.
                    </p>

                    <!-- UNIFIED CALENDAR -->
                    <table class=3D"body-action" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0"
                           role=3D"presentation"
                           style=3D"padding:10px 0;">
                      <tr>
                        <td align=3D"center">
                          <img alt=3D"Unified Calendar" align=3D"center" wi=
dth=3D"auto" height=3D"auto"
                               src=3D"http://cdn.mcauto-images-production.s=
endgrid.net/453850d1ef435f28/6fbb38c0-06c0-42f4-ac4d-57f6285a00e3/309x241.p=
ng"
                               style=3D"display: block; text-decoration: no=
ne; margin: 0 auto;">
                        </td>
                      </tr>
                    </table>

                    <h1 class=3D"fallback-font" style=3D"padding-top:10px;"=
>Unified Calendar</h1>
                    <p class=3D"fallback-font"
                       style=3D"padding-top: 1px; text-decoration:none;">
                      No matter where your calendars may have originated fr=
om, Calendar brings them all into one place
                      making it easy to see what is coming up in your busy =
life and allowing you to be as productive
                      and efficient as possible.
                    </p>

                    <!-- CALENDAR ANALYTICS -->
                    <table class=3D"body-action" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0"
                           role=3D"presentation"
                           style=3D"padding:10px 0;">
                      <tr>
                        <td align=3D"center">
                          <img alt=3D"Calendar Analytics" align=3D"center" =
width=3D"auto" height=3D"auto"
                               src=3D"http://cdn.mcauto-images-production.s=
endgrid.net/453850d1ef435f28/0a01fbb1-a176-49b2-8bc2-76a96dbd4409/356x241.p=
ng"
                               style=3D"display: block; text-decoration: no=
ne; margin: 0 auto;">
                        </td>
                      </tr>
                    </table>

                    <h1 class=3D"fallback-font" style=3D"padding-top:10px;"=
>Calendar Analytics</h1>
                    <p class=3D"fallback-font"
                       style=3D"padding-top: 1px; text-decoration:none;">
                      The analytic features will allow you to see where you=
 are spending your time so you can adjust
                      to become more efficient and time-aware than ever bef=
ore.
                    </p>

                    <!-- FIND A TIME -->
                    <table class=3D"body-action" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0"
                           role=3D"presentation"
                           style=3D"padding:10px 0;">
                      <tr>
                        <td align=3D"center">
                          <img alt=3D"Find a Time" align=3D"center" width=
=3D"auto" height=3D"auto"
                               src=3D"http://cdn.mcauto-images-production.s=
endgrid.net/453850d1ef435f28/5a27b3d8-9a67-48a1-902e-8a3ce9f02c6a/355x290.p=
ng"
                               style=3D"display: block; text-decoration: no=
ne; margin: 0 auto;">
                        </td>
                      </tr>
                    </table>

                    <h1 class=3D"fallback-font" style=3D"padding-top:10px;"=
>Find a Time to Meet</h1>
                    <p class=3D"fallback-font"
                       style=3D"padding-top: 1px; text-decoration:none;">
                      Calendar's find a time feature allows you to compare =
your team's schedules to find a time that
                      works for everyone and eliminates the time-wasting ba=
ck and forth emails trying to find a time
                      that works for everyone.
                    </p>

                    <!-- SCHEDULING -->
                    <table class=3D"body-action" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0"
                           role=3D"presentation"
                           style=3D"padding:10px 0;">
                      <tr>
                        <td align=3D"center">
                          <img alt=3D"Scheduling" align=3D"center" width=3D=
"auto" height=3D"auto"
                               src=3D"http://cdn.mcauto-images-production.s=
endgrid.net/453850d1ef435f28/84a6f378-997a-4a34-b275-f068ac375636/302x224.p=
ng"
                               style=3D"display: block; text-decoration: no=
ne; margin: 0 auto;">
                        </td>
                      </tr>
                    </table>

                    <h1 class=3D"fallback-font" style=3D"padding-top:10px;"=
>Scheduling Time Slots</h1>
                    <p class=3D"fallback-font"
                       style=3D"padding-top: 1px; text-decoration:none;">
                      With Calendar's customizable scheduling links, anyone=
 can sign up on your or your team=E2=80=99s calendar
                      and choose a time that works for everyone, making sch=
eduling with external people a breeze.
                    </p>

                    <p class=3D"fallback-font"
                       style=3D"padding-top: 12px; text-decoration:none;">
                      Calendar is the answer to all your time-wasting sched=
uling headaches and is available at the best
                      price because a world where everyone is efficient and=
 organized is a better world
                      for everyone!
                    </p>

                    <!-- VISIT -->
                    <p class=3D"fallback-font" style=3D"padding-top:10px;">
                      <strong>Visit
                        <a class=3D"blue-text"
                           href=3D"http://url9539.calendar.com/ls/click?upn=
=3Daa4TH9t09kvpm62FQweLsD3woqUXRbKEZE-2BsoN0isCA-3DhDTe_yxe3hxlEKZLb36qs-2B=
KApVr7ZX4aFxpSJbhjNkBlCEPRTGIvXkRptALDz9gXFwao8y4ItIgChaVYo7bx3VpP-2F5TBD32=
58BSCOvCEIvSzBivjLXKbip2HKcTbaJjmMxAV02Tz6GEEKHjfTBFqwhyRXDUehQZkz9DyJQVXup=
M0Ig6BPkGH-2BjetccYKJi-2B5MkRy-2Fkz2OTAQd2b5CO8OP32fCYM1jBMKtv-2FNb-2BqM5tR=
Mj7xM5XwEdzpuSpiC1T9arSKFt2ajGI-2FXh2XPt8JMplkfgB6wtf7EKfMphzb3xrFsu55sNL1e=
BRph3giBXKYgvg1CxGF5lgQXn-2BVVz0Inpuya9YFXVjLCgtxPKubwei1oF-2FJbtm1lSfUUZwI=
xLc9ZEptlu4yIlyQyVQv10gJjxk05rEbtWI5FbCDrDjESmPmJ8WRHHm0IvI7rCHt-2Fag9bInNs=
3CmxtGPldOPopQqs9I1Q5oaexN0oaPi9M5ocvIz6LkT7cljOv54JHFWK0-2B9t0q2OHMq078rGZ=
1Eq63nzaRQAby4FVHjO1YNvvkGRI-2FCgPE4dEZMw2IoAt1qU1dmgaRSMdeURdIspuMpUxoaqP3=
U4xzjQIRHZ4HhzVbfIquPu006JJ7bVPsyUw5QcXEsKRGxokJ10nXkpAmbKplzBZA9mNz8yp97Ix=
1sLN2J6FLC2yTm-2F9oX2PTZC-2Bk290ep405S38Uu6pQdWnX45HPyicQ72BOFJPZ7lES5-2FW5=
CzkZix0sp9TAXpl-2FHYjGaYF-2FK-2FsXqIdL3PE8-2BMKrYK5xkBhQ-2FtZ5jUqFVBcxOj9yS=
tR-2BWAIuy-2B3LQ9WVHIIVDb4no3DNS3QeEL92B7qTCJETDUIS3oWIU-2F6H37lK9HxFCO9aaS=
q6DUFqXDZnltbP3sSY7yNUCwChlO383Jadf0R-2BYm9DIm0JIfrSGyUKhuTiP7k-2B5aMDw0-3D=
" target=3D"_blank">
                          Calendar.com
                        </a>
                        to start your 30-day free trial</strong>
                    </p>

                    <!-- JOIN -->
                    <table class=3D"body-action" align=3D"center" width=3D"=
100%" cellpadding=3D"0" cellspacing=3D"0"
                           role=3D"presentation"
                           style=3D"padding-top:20px;">
                      <tr>
                        <td style=3D"display:block;">
                          <table width=3D"100%" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation">
                            <tr>
                              <td align=3D"right">
                                <img alt=3D"Join Calendar!"
                                     src=3D"http://cdn.mcauto-images-produc=
tion.sendgrid.net/453850d1ef435f28/6dc3167f-069f-4fd1-a449-a3f7175c7977/65x=
74.png"
                                     style=3D"max-width:60px; padding-left:=
8px; padding-right:3px;
                                       padding-bottom:3px;
                                       vertical-align:middle; margin:0 auto=
; border:0;"
                                     border=3D"0" align=3D"center"/>
                              </td>
                              <td align=3D"center">
                                <span class=3D"fallback-font">Be More Produ=
ctive. Save Time. Focus.</span>
                                <br>
                                <a class=3D"blue-text"
                                   href=3D"http://url9539.calendar.com/ls/c=
lick?upn=3Daa4TH9t09kvpm62FQweLsD3woqUXRbKEZE-2BsoN0isCA-3DMu7c_yxe3hxlEKZL=
b36qs-2BKApVr7ZX4aFxpSJbhjNkBlCEPRTGIvXkRptALDz9gXFwao8y4ItIgChaVYo7bx3VpP-=
2F5TBD3258BSCOvCEIvSzBivjLXKbip2HKcTbaJjmMxAV02Tz6GEEKHjfTBFqwhyRXDUehQZkz9=
DyJQVXupM0Ig6BPkGH-2BjetccYKJi-2B5MkRy-2Fkz2OTAQd2b5CO8OP32fCYM1jBMKtv-2FNb=
-2BqM5tRMj7xM5XwEdzpuSpiC1T9arSKFt2ajGI-2FXh2XPt8JMplkfgB6wtf7EKfMphzb3xrFs=
u55sNL1eBRph3giBXKYgvg1CxGF5lgQXn-2BVVz0Inpuya9YFXVjLCgtxPKubwei1oF-2FJbtm1=
lSfUUZwIxLc9ZEptlu4yIlyQyVQv10gJjxk05rEbtWI5FbCDrDjESmPmJ8WRHHm0IvI7rCHt-2F=
ag9bInNs3CmxtGPldOPopQqs9I1Q5oaexN0oaPi9M5ocvIz6LkT7cljOv54JHFWK0-2B9t0q2OH=
Mq078rGZ1Eq63nzaRQAby4FVHjO1YNvvkGRI-2FCgPE4dEZMw2IoAt1qU1dmgaRSMdeURdIspuM=
pUxoaqP3U4xzjQIRHZ4HhzVbfIquPu006JJ7bVPsyUw5QcXEsKRGxokJ10nXkpAmbKplzBZA9mN=
z8yp97Ix1sLN2J6FLC2yTm-2F9oX2PTZC-2Bk290ep405S38Uu6pQdWnX45HPyicQ72BOHftgE-=
2BjIYMx-2BiOajE9J0gFk5S6ikLT56s3PRywrGZsXwEtUIBGm2jIfSZzBWdcGkRSB9-2BFxmnZT=
q-2BrZqWQXZrEF7XHaorSaUpgjnUMPr3Zuw3aTqao9cZlrx4BEsCWyIx4r1Kq458wp-2FDsRKvM=
lBxo2cEQs-2F8L4VaGSiI56vsLTSa-2FGlZnvGkJUdqLXnaTl-2F2CKBCWDkGq7fkD25X6lU4k-=
3D" target=3D"_blank">
                                  Join Calendar for free today.
                                </a>
                              </td>
                          </table>
                        </td>
                      </tr>
                    </table>

                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <!-- FOOTER -->
        <tr>
          <td>
            <table class=3D"email-footer" align=3D"center" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation">
              <tr>
                <td align=3D"center">
                  <p class=3D"fallback-font small-gray" style=3D"text-decor=
ation:none;">
                    &copy; 2021 Calendar.&#173;com
                    <br>
                    <span style=3D"text-decoration: none;">support@calendar=
.com</span>
                  </p>
                </td>
              </tr>

              <!-- UNSUBSCRIBE -->
              <tr>
                <td align=3D"center">
                  <div style=3D"font-family:inherit; text-align:center; fon=
t-size:12px; line-height:1.4; text-decoration:none;">
                    <a style=3D"text-decoration:none;"
                       href=3D"http://url9539.calendar.com/wf/unsubscribe?u=
pn=3DVU2koNEWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFc=
qrQhM-2F5O-2B1Io8-2BjTZz5LGhyF-2FDrYTzigOGR-2F-2BA9EChTdFDj7-2BFSIu4taSaBGH=
R8jv2WbbNfbrD5QBcmCtPtwb5hD-2FJtKtkbSr3cgulhdBf6HkC5nutjNudJhmGNmArh68oQWaX=
KsFVUo5oNoENgPU0JY8FbtXlqW0jo7t1gJ8yGM7SiBtIB5LHyjcHz6ITN8BR700QcZkkHmWbi5H=
dIies-2F-2BJcAnI8B8YsOkdlT9uZ4UZihjqVYe7uKPZhMewD6-2BfHmov0HDT1pgXmrlSI595j=
e8jKbZl0JAzgf0vV7RKpPiPg5mzJEMagdjtgCgU-2FNqLpcMV-2BGIdtirgbWArS5GXoNYIQvgR=
LCWSUyhXjWwZqvSiXRGcg46MKQeXsFqibJdQQZG8uiMgDJygmjIPIqJCbJ5rgM3MMiHFf7NsbKC=
X1CacqZ6xbmb3jY47hIA57zbhtqy-2BWb3szQQf17YRfPI8R0D4OAcXqWWMsxUjb9XscfgmWaTS=
cZVUQLjJSAwftgpavU08DypiN4xzTVKI1Y5MywUv6STk8xPyr-2FuKD88KWkbBu-2FgCuKMTESf=
FxxTNJmG2NCOetvTnCr2EOtvrd-2FOtS-2FfPD8IIA-2BAZS4bQGW4Ncl-2FVL6D9yYm5AtFs-2=
FXue1xzDWS89r98cOreBVKq81J7eLxvwZzdc3yiZshCCSj-2BgMvRLMj5wzmTwBFHXrRAzWNZDw=
1Ginua4VKZEdVWbrBgTRZ09gFkBoc5L8Al2Vj7w-2FbZc1jdw3wO5R5cZyeL4ga-2Ff4hK91I-2=
Fa3eoZpua22aofY5mkhXaQDEL8UuSxEjyH0UU2oCtgf7G0I8bu0dm2ZEd-2FB-2BkKQk-2FPHZv=
j-2BInH-2Fk5zRcCkV0kvcyXdN2OXi0JI-3D" target=3D"_blank">
                    <span class=3D"fallback-font"
                          style=3D"color: #ADB0B9; font-size:10px; line-hei=
ght:1.4; text-decoration:none;">
                      Unsubscribe
                    </span>
                    </a>
                  </div>
                </td>
              </tr>

            </table>
          </td>
        </tr>

      </table>
    </td>
  </tr>
</table>

<img src=3D"http://url9539.calendar.com/wf/open?upn=3DVU2koNEWgSKMLPFeqEdbN=
I9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-2B1Io8-2BjTZz5L=
GhyF-2FDrYTzigOGR-2F-2BA9EChTdFDj7-2BFSIu4taSaBGHR8jv2WbbNfbrD5QBcmCtPtwb5h=
D-2FJtKtkbSr3cgulhdBf6HkC5nutjNudJhmGNmArh68oQWaXKsFVUo5oNoENgPU0JY8FbtXlqW=
0jo7t1gJ8yGM7SiBtIB5LHyjcHz6ITN8BR700QcZkkHmWbi5HdIies-2F-2BJcAnI8B8YsOkdlT=
9uZ4UZihjqVYe7uKPZhMewD6-2BfHmov0HDT1pgXmrlSI595je8jKbZl0JAzgf0vV7RKpPiPg5m=
zJEMagdjtgCgU-2FNqLpcMV-2BGIdtirgbWArS5GXoNYIQvgRLCWSUyhXjWwZqvSiXRGcg46MKQ=
eXsFqibJdQQZG8uiMgDJygmjIPIqJCbJ5rgM3MMiHFf7NsbKCX1CacqZ6xbmb3jY47hIA57zbht=
qy-2BWb3szQQf17YRfPI8R0D4OAcXqWWMsxUjb9XscfgmWaTScZVUQLjJSAwftgpavU08DypiN4=
xzTVKI1Y5MywUv6STk8xPyr-2FuKD88KWkbBu-2FgCuKMTESfFxxTNJmG2NCOetvTnCr2EOtvrd=
-2FOtS-2FfPD8IIA-2BAZS4bQGW4Ncl-2FVL6D9yYm5AtFs-2FXue1xzDWS89r98cOreBVKq81J=
0Obn0JQMlbmcMTRlmbXPTG5jKGRdRfDuaWK1hQS7xT86qPuflu-2BvgaBkSFofwNfxiO4SPN-2B=
pDqwVgoxPQTRmH0OfPBkyp3J1I9UrOu-2FYZBO2NzGuiSM9A-2BkYfUQmJocgH3SyHYQs5dFtK5=
kqJ6t8ccSe9oA-2FZ2S1plk3x7ePpRSPs1hQtzs00eWyg5saxhMEBFitMGKN93o4URIy26aTVw-=
3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !imp=
ortant;width:1px !important;border-width:0 !important;margin-top:0 !importa=
nt;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !impo=
rtant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 =
!important;padding-left:0 !important;"/>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ZJqa6ZWkQhut_vghNtB-vA%40ismtpd0095p1iad2.sendgrid=
.net?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/ZJqa6ZWkQhut_vghNtB-vA%40ismtpd0095p1iad2.sendgrid.net</a=
>.<br />

--8d53a5d0d9ddbc0d841ba905c55bd865637118901e02f58aaf8abde50407--
