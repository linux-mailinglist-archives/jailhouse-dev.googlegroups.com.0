Return-Path: <jailhouse-dev+bncBC3ONHO2ZUDBBUNIV2BAMGQE7I5QAIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6A3392E4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 17:18:26 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id r12sf11383605wro.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 08:18:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615565906; cv=pass;
        d=google.com; s=arc-20160816;
        b=sWDIcIQ+BjUNpg2wjA7EHwdGdfyZybov7830IdqGEYXWcRKck6CvPnqwLJc71gtjXI
         sd2alEaDAvz114vHICzWRrv9Aj8QE8jC68pfsZBsjdgOS8YClhnH/arIOvQPYee5Nflb
         sRxgeBuiDGUQ160rynmusZRAarcB6uIVTBfpxXGFbjWkCTmpuVbQr59Hjcj38rO+0oCi
         Zk6Ir6HLoyUgQqDUM/i2pkYqM5w16GL7YKsCera/S3k7IChYSI6vugYbdJVVUQhvBTwN
         JCUM06Hji5Ye9PgNGHR4zjcto2WBt3xJXnyOPYVeZBfPwJ0LWHj4in4HfC0/78GBSp3F
         73hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:list-unsubscribe:subject:message-id:to
         :reply-to:mime-version:from:date:sender:dkim-signature;
        bh=kgO9krE4q5pudfF5fkxgK/7m31XcvBmkYjnF+hF6fWk=;
        b=0i5U5Z1+VuCqQh/op1POhIhQugmE3iey+WqeEtC6aI9irZL1BAejYlP8SOSmgLMXZI
         PSPlrSPcDif72iulnxvsMFPdAYEHXF1VfrOqIxtJpe9NtE22qlosQeWLYKcob9yUHexD
         sc0g9V+lOZX8adIfZQtOx8mk3WQ5tszJDTf9LkqMUg3Sv/+BcUPdBwah/DAza7/ybjpZ
         QBWYauVL9Ro9/+3RVOJWTrG2kD5X1L5Dfj2cAfQ8U2U9SoWdj7bAqxFoesI58Xajwz1e
         GCqG7YCz2/g7mcengnUkbXQSEa7JxpQYgSXSMaUsAlvit7HH+FRexY1adIYyVQhdJdga
         E3AQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=VjfL7tjJ;
       spf=pass (google.com: domain of bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:mime-version:reply-to:to:message-id:subject
         :list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=kgO9krE4q5pudfF5fkxgK/7m31XcvBmkYjnF+hF6fWk=;
        b=D4es6P17BakFfvsdeQEGEDw1JwrZ4Ke+CyhGDdizypQe4WyQBLPh15a1FSsrUcMpUZ
         v2QGiPhUxZ0+dnnSsHy2ddlkIpHiAHqP+RrkU45CBYx6FkLKA5BH7VPMB/gKbC2wfg2T
         80wPOrIJn7qV4QL+5QkReAWvpahr+Jpk2l7XV14Rb96DiRb3hLNabnKrG53RqCPm2/pU
         z2yLJMsIBsQJL7KowVK3kZ/+Yy1aRsym0t4yFySdFcmSibxiyjCWfjWtQI0UtUHALFyP
         ob+6v60Wzhxx8grEDxm+Rktl3vPSjTJOiS0zOVhATU9FewaNfxUr8V5VTvIP7EaHfzv5
         sIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:mime-version:reply-to:to
         :message-id:subject:list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=kgO9krE4q5pudfF5fkxgK/7m31XcvBmkYjnF+hF6fWk=;
        b=MNimAjYskcz3aaAFw2LgBvaD/eOehvFIEhFD3DQyuJGrb07lUbgTRdwNkiYyhFbBKI
         852j41IM654+XjtkPzgN2IUJ3BTg+P53gNpfyvIySL+I1j6yGLyQgRizWLWSJMWMT7RP
         VU0ttm2iGtadKc3T9F62oP+RD9OuuUY4cAl0mChfU6g2B5j0fpZGNGq69YOCgvx72iAv
         oItzJG93k0zf90E0HPF+7xVi3UuWbk6lPgX4ucH9bi38BYxpWvfh1WxRrUoCc3eVVuJp
         zy50KB5C1xQlx6ZUo+pmuoM/5eT8atlC9pCegA2aP6t0YlvHN5tFsL+gctHC+VlXBD5q
         GPjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533B26kHEGo+qM34IJtvAjPG4pbRhHP1htpJK6YdrAT4QH59riN8
	1aLdIYL4kckdUtq6cuOanJY=
X-Google-Smtp-Source: ABdhPJzp1h1ctcpa23L7lg5m0G+y2saT984OW6NJ5I2Jj5EQXgnHiXqqnhgBmadtOoccLn9UKI1YtQ==
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr14331028wrw.415.1615565906184;
        Fri, 12 Mar 2021 08:18:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:24d4:: with SMTP id k203ls445829wmk.0.canary-gmail; Fri,
 12 Mar 2021 08:18:25 -0800 (PST)
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr14065680wmd.151.1615565905248;
        Fri, 12 Mar 2021 08:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615565905; cv=none;
        d=google.com; s=arc-20160816;
        b=iWmWyAxnneG8Pf0bqg9CwxDTCBuJWHV4F8BaEOnQeBFKpLc9/wjRvRMX60t4e/ZpOo
         QKViWbfHY6w5lopwTrFWyRNfFLTS+mBYkNTi/Q0D7iC13QvYXLmXSAmMjGdXDhgJQTCg
         vvBYPAi9ItpRRhUQsTooZ1dqi+0xk0iUrkF+WiMqjQBDtO3kC4EPbctrTo8es7Qoyz0y
         AVTodfsLkGYbxE1PhUhan2lHg9DvLXdZAXOmToa5EHmhAMw0HfT0F+Q2bCxGifaS866q
         g8pwUvnLaIB3T24GD0BKfAWp3cfaalkYnm8J1FeZp2L4H3LS3VpYtxI5KN50qqc/X+ev
         +Ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:subject:message-id:to:reply-to:mime-version:from
         :date:dkim-signature;
        bh=SLp9tSfD01Td6Bc0nmTg16dW6JzItRZLl6df6MPwuPM=;
        b=jCDa0pYIsIXda6yYk70f7boSjYp5bQS2+KB1DOMb/4rtyb5lyfkdFU7VCSYWak9SDw
         02yGC6MO5IcLAKSZcHDoBhFQSkE391fa3N3UUhYhqWZRnwzukkCOsiFotP9MvBvFQjsZ
         FeEgMi3qPr+d0yzETd6H3G7bCZqCh5ct7r8U2bIippUzNLD2/GsbkafVM+PTujAYcx9c
         ow9F+Fy3M6Yz60aQZKinr3mNbnvPbN18fSXwdbArLfXi4ocIy7TAl20ATXtlOXHc4+Km
         fF85q4iO6QoIMldpkcIAHBUWJJrSJ9A6WHhtYThZwhh/uDIcID5gZiL9OAs19GXWMsNg
         vjuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=VjfL7tjJ;
       spf=pass (google.com: domain of bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net"
Received: from wrqvxsnb.outbound-mail.sendgrid.net (wrqvxsnb.outbound-mail.sendgrid.net. [149.72.166.43])
        by gmr-mx.google.com with ESMTPS id b5si37823wmc.2.2021.03.12.08.18.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 08:18:25 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) client-ip=149.72.166.43;
Received: by filter1677p1las1.sendgrid.net with SMTP id filter1677p1las1-31186-604B944B-2F
        2021-03-12 16:18:19.646817835 +0000 UTC m=+977767.284976889
Received: from MTE3MzUxNDk (unknown)
	by ismtpd0163p1iad2.sendgrid.net (SG) with HTTP id F0x1FnRHTD6Z5L_h1JftdA
	Fri, 12 Mar 2021 16:18:19.505 +0000 (UTC)
Content-Type: multipart/alternative; boundary=7cbfc03bbb715a8a3494de60a6f6e2c7f54f4eee51e6ce8a991d98663757
Date: Fri, 12 Mar 2021 16:18:23 +0000 (UTC)
From: "Tina Evans" <Tina.Evans@emailcampaignlead.com>
Mime-Version: 1.0
Reply-To: Tina.Evans@emailcampaignlead.com
To: jailhouse-dev@googlegroups.com
Message-ID: <F0x1FnRHTD6Z5L_h1JftdA@ismtpd0163p1iad2.sendgrid.net>
Subject: Updated Customer base of Red Hat
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mNsOAwqoMVeZBCa
 XQdVJb5FqZELFe8GfG0I5IWZlK/10o+qRktjeLR/YfGRydFuqr39XnMqjqvlYX7HqnVpN4X/q8sFyQ
 0/L4CVd8ocDjBmgwqMYwqhbOrAdWIgYSRbhgF9tHq859k+/OSpXA3r8KtjGCHjiOsYupj7GUKn7oUd
 YpLn+YFgAR+l2d7Umz6Sh1
X-SG-ID: mcTyqcYTtmn56LU3ATD1f8GKaqlBe767412Y30Rr9IwmKq++Xd6xQJ0fHi7kwe0DudNAeDzzJjxKrb
 5hYFYggtW+s+ZIFQT/W9Op3zgRrFIeg75VmYXD/PtTH49zOu4m1qk3Al4ZiW9AY27DDDQlnHOR/NBo
 YV5usBrWFJfkDeqJVISEBQ+yLd4Tx+/k9LLqBSTd/Kg+ondi5Woj8z/JvsfnO6+OPmDAHe/fHu+uF6
 d5FAmTTCY+k0oot4zkOa0VyfSLXfeDkRt5t+lmPr9kNkv2wP1xnSLOR+D8aqpdAr57kcViJEYjEfsf
 IwUhg5DDEwX0N3sg1fSqFQEe+qRxSk3kXDdK1uY3T1+f1P3RAO98STRWTRyW/qRiCEi62q1dSZljs+
 ZebhwTyyVYT9qUSgdpfDTeyYhuPNI/CbTR08xX1dQ0531V9IIhdEx/5ybvXHCqKXC2r/wDhqQKuplb
 p1D8IDQCxHji4iRSy755MGzFzMJHuQwjAT2Vb1aTbTRHImXa/j9vr5RLpQM926p8wzBaKxWPM3lW/r
 xt/xyhGdODwVzuul+s5eVjWTL+a24txU0Dwephpks7FL55A1Cb7uwug0ssuIteq/k4GbcPMRy7d8h/
 0qSBFkQW9uKJnqpG
X-Entity-ID: q31SKZ+NWjSywWsmKjil7Q==
X-Original-Sender: tina.evans@emailcampaignlead.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@sendgrid.net header.s=smtpapi header.b=VjfL7tjJ;       spf=pass
 (google.com: domain of bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net
 designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+11735149-658b-jailhouse-dev=googlegroups.com@sendgrid.net"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--7cbfc03bbb715a8a3494de60a6f6e2c7f54f4eee51e6ce8a991d98663757
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Get in Touch with Red Hat Users

Hi,

We provide market intelligence that is truly global, delivering strong cove=
rage in the Americas, Asia, and Europe. This is the type of reach our inter=
national customers demand worldwide Go-to-Market initiatives.

Would you like to target *Red Hat Decision Makers* to uncover their likely =
pain points and provide a solution with your product?

Knowing the exact accounts that comprise a region also makes it easy for sa=
les leaders to develop more equitable and profitable territories, and alloc=
ate the right headcount to the most lucrative markets.

If you would like to know more about this, I can share a sample file, count=
s, and pricing details.

*Thanks,
Tina Evans
Marketing Manager*

Tina Evans

4 Armstrong Court , Emporia , KS 66801

Unsubscribe ( https://u11735149.ct.sendgrid.net/wf/unsubscribe?upn=3DVU2koN=
EWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-=
2B1Io8-2BjTZz5BTTim2A2uszKZcS9nVmUmh31EV2AwPw1R1Mj5LAnCzdfpUajlLI7FfEpIq6lZ=
41rLQhNF8B9-2FISUBDdes1noJEvXVUQ2tkkjTS6GzbE1g9S29RvupDd9EnEHmQt8qY9vgMTWNa=
8XSB9uZJUrnVpOx91IQM-2B7do7icE6TifU2fp-2FHUXJVBfQnU4QdFZORf6ltB4WPPi-2BCzoJ=
XgXX-2B4DFNX-2BfDYbjjzHnMJLqXOWLKDtK74RTJJAr-2Fu8QD8NHFYAMsDdTdKlweP-2BDmNC=
NIlcUzV8NX-2BPgxWQzr-2F-2BDNGMalKQ1Z-2FWGisXXqzV6-2FnQIv0b6JMlXKK-2BLiztjmG=
edDtngjpBV1eOkbRI0Oxqc1KB8LyvvmHszbkU6t4XdATcPQOESMjmSk96KhjtU-2FW5UjxAg1aE=
J5acmI1weHXVWVzqvi0doWR2ESV8rZdzHAZMXhD0v9u63Otv4NMqHBpP-2FXj3xKrJpxP-2FJQn=
GK2VzNynYhXzhsKHbE1Jbjm8mUJbG-2B1zfC9RsedjIhAGqX0OP0PWgc-2FicouVMQWoVgc80zd=
jGNehMbKU1-2Ba3hkqcdYfSWC18G-2BFeHM2MgNc3X9EAMnhEvxjmUvry5cvYgILTB6XTyKkEfU=
1ReOWVik-2B05bcvorK3BpveWBaw8-2BWl-2FvR8nwQptfKXlDfqSO-2FmZo753jJmSoWoY0SkO=
U8E6A-2BlNAhJTR2copU5rjyl7CpG85Fqi94Rcv-2BCztTSm0W5A9JHN6YPmwi36b1hmZB4Aama=
dY1TmuqKOzuKpVDP5TfI92UuvY0cyVeMk-3D )

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/F0x1FnRHTD6Z5L_h1JftdA%40ismtpd0163p1iad2.sendgrid.net.

--7cbfc03bbb715a8a3494de60a6f6e2c7f54f4eee51e6ce8a991d98663757
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html data-editor-version=3D"2" class=3D"sg-campaigns" xmlns=3D"http://www.=
w3.org/1999/xhtml">
    <head>
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
      <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scal=
e=3D1, minimum-scale=3D1, maximum-scale=3D1">
      <!--[if !mso]><!-->
      <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3DEdge">
      <!--<![endif]-->
      <!--[if (gte mso 9)|(IE)]>
      <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
      </xml>
      <![endif]-->
      <!--[if (gte mso 9)|(IE)]>
  <style type=3D"text/css">
    body {width: 600px;margin: 0 auto;}
    table {border-collapse: collapse;}
    table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
    img {-ms-interpolation-mode: bicubic;}
  </style>
<![endif]-->
      <style type=3D"text/css">
    body, p, div {
      font-family: arial,helvetica,sans-serif;
      font-size: 14px;
    }
    body {
      color: #000000;
    }
    body a {
      color: #1188E6;
      text-decoration: none;
    }
    p { margin: 0; padding: 0; }
    table.wrapper {
      width:100% !important;
      table-layout: fixed;
      -webkit-font-smoothing: antialiased;
      -webkit-text-size-adjust: 100%;
      -moz-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }
    img.max-width {
      max-width: 100% !important;
    }
    .column.of-2 {
      width: 50%;
    }
    .column.of-3 {
      width: 33.333%;
    }
    .column.of-4 {
      width: 25%;
    }
    @media screen and (max-width:480px) {
      .preheader .rightColumnContent,
      .footer .rightColumnContent {
        text-align: left !important;
      }
      .preheader .rightColumnContent div,
      .preheader .rightColumnContent span,
      .footer .rightColumnContent div,
      .footer .rightColumnContent span {
        text-align: left !important;
      }
      .preheader .rightColumnContent,
      .preheader .leftColumnContent {
        font-size: 80% !important;
        padding: 5px 0;
      }
      table.wrapper-mobile {
        width: 100% !important;
        table-layout: fixed;
      }
      img.max-width {
        height: auto !important;
        max-width: 100% !important;
      }
      a.bulletproof-button {
        display: block !important;
        width: auto !important;
        font-size: 80%;
        padding-left: 0 !important;
        padding-right: 0 !important;
      }
      .columns {
        width: 100% !important;
      }
      .column {
        display: block !important;
        width: 100% !important;
        padding-left: 0 !important;
        padding-right: 0 !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
      }
      .social-icon-column {
        display: inline-block !important;
      }
    }
  </style>
      <!--user entered Head Start--><!--End Head user entered-->
    </head>
    <body>
      <center class=3D"wrapper" data-link-color=3D"#1188E6" data-body-style=
=3D"font-size:14px; font-family:arial,helvetica,sans-serif; color:#000000; =
background-color:#FFFFFF;">
        <div class=3D"webkit">
          <table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"=
100%" class=3D"wrapper" bgcolor=3D"#FFFFFF">
            <tr>
              <td valign=3D"top" bgcolor=3D"#FFFFFF" width=3D"100%">
                <table width=3D"100%" role=3D"content-container" class=3D"o=
uter" align=3D"center" cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
                  <tr>
                    <td width=3D"100%">
                      <table width=3D"100%" cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0">
                        <tr>
                          <td>
                            <!--[if mso]>
    <center>
    <table><tr><td width=3D"600">
  <![endif]-->
                                    <table width=3D"100%" cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"width:100%; max-width:600px;" alig=
n=3D"center">
                                      <tr>
                                        <td role=3D"modules-container" styl=
e=3D"padding:0px 0px 0px 0px; color:#000000; text-align:left;" bgcolor=3D"#=
FFFFFF" width=3D"100%" align=3D"left"><table class=3D"module preheader preh=
eader-hide" role=3D"module" data-type=3D"preheader" border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"display: none !important;=
 mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height:=
 0; width: 0;">
    <tr>
      <td role=3D"module-content">
        <p>Get in Touch with Red Hat Users</p>
      </td>
    </tr>
  </table><table class=3D"module" role=3D"module" data-type=3D"text" border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"table-la=
yout: fixed;" data-muid=3D"afbaff30-8d5d-4774-8db1-c7ccf08c55fa">
    <tbody>
      <tr>
        <td style=3D"padding:18px 0px 18px 0px; line-height:22px; text-alig=
n:inherit;" height=3D"100%" valign=3D"top" bgcolor=3D"" role=3D"module-cont=
ent"><div><div style=3D"font-family: inherit">Hi,<br>
<br>
We provide market intelligence that is truly global, delivering strong cove=
rage in the Americas, Asia, and Europe. This is the type of reach our inter=
national customers demand worldwide Go-to-Market initiatives.<br>
<br>
Would you like to target <strong>Red Hat Decision Makers</strong> to uncove=
r their likely pain points and provide a solution with your product?<br>
<br>
Knowing the exact accounts that comprise a region also makes it easy for sa=
les leaders to develop more equitable and profitable territories, and alloc=
ate the right headcount to the most lucrative markets.<br>
<br>
If you would like to know more about this, I can share a sample file, count=
s, and pricing details.<br>
<br>
<strong>Thanks,<br>
Tina Evans<br>
Marketing Manager</strong></div><div></div></div></td>
      </tr>
    </tbody>
  </table><div data-role=3D"module-unsubscribe" class=3D"module" role=3D"mo=
dule" data-type=3D"unsubscribe" style=3D"color:#444444; font-size:12px; lin=
e-height:20px; padding:16px 16px 16px 16px; text-align:Center;" data-muid=
=3D"4e838cf3-9892-4a6d-94d6-170e474d21e5"><div class=3D"Unsubscribe--addres=
sLine"><p class=3D"Unsubscribe--senderName" style=3D"font-size:12px; line-h=
eight:20px;">Tina Evans</p><p style=3D"font-size:12px; line-height:20px;"><=
span class=3D"Unsubscribe--senderAddress">4 Armstrong Court</span>, <span c=
lass=3D"Unsubscribe--senderCity">Emporia</span>, <span class=3D"Unsubscribe=
--senderState">KS</span> <span class=3D"Unsubscribe--senderZip">66801</span=
></p></div><p style=3D"font-size:12px; line-height:20px;"><a class=3D"Unsub=
scribe--unsubscribeLink" href=3D"https://u11735149.ct.sendgrid.net/wf/unsub=
scribe?upn=3DVU2koNEWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEa=
OPsPJfFcqrQhM-2F5O-2B1Io8-2BjTZz5BTTim2A2uszKZcS9nVmUmh31EV2AwPw1R1Mj5LAnCz=
dfpUajlLI7FfEpIq6lZ41rLQhNF8B9-2FISUBDdes1noJEvXVUQ2tkkjTS6GzbE1g9S29RvupDd=
9EnEHmQt8qY9vgMTWNa8XSB9uZJUrnVpOx91IQM-2B7do7icE6TifU2fp-2FHUXJVBfQnU4QdFZ=
ORf6ltB4WPPi-2BCzoJXgXX-2B4DFNX-2BfDYbjjzHnMJLqXOWLKDtK74RTJJAr-2Fu8QD8NHFY=
AMsDdTdKlweP-2BDmNCNIlcUzV8NX-2BPgxWQzr-2F-2BDNGMalKQ1Z-2FWGisXXqzV6-2FnQIv=
0b6JMlXKK-2BLiztjmGedDtngjpBV1eOkbRI0Oxqc1KB8LyvvmHszbkU6t4XdATcPQOESMjmSk9=
6KhjtU-2FW5UjxAg1aEJ5acmI1weHXVWVzqvi0doWR2ESV8rZdzHAZMXhD0v9u63Otv4NMqHBpP=
-2FXj3xKrJpxP-2FJQnGK2VzNynYhXzhsKHbE1Jbjm8mUJbG-2B1zfC9RsedjIhAGqX0OP0PWgc=
-2FicouVMQWoVgc80zdjGNehMbKU1-2Ba3hkqcdYfSWC18G-2BFeHM2MgNc3X9EAMnhEvxjmUvr=
y5cvYgILTB6XTyKkEfUPt5w5jwL8iIYSTrZcsChVrfmfkwoohk3c-2BKnaLA-2BPQaKrnxOvvht=
Jg-2B36KGI2FKlkLQqZMAPTT-2F9UlSRHQkVrXIIC9Y3fgGaQoDy5lcSoT-2Br8sSri7lqgYPjo=
kUhQd0o7QL-2BkvuNVZlolfM0qpF3lZoMllpUxM7kPKfat4b9WtE-3D" target=3D"_blank" =
style=3D"">Unsubscribe</a></p></div></td>
                                      </tr>
                                    </table>
                                    <!--[if mso]>
                                  </td>
                                </tr>
                              </table>
                            </center>
                            <![endif]-->
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </center>
   =20
<img src=3D"https://u11735149.ct.sendgrid.net/wf/open?upn=3DVU2koNEWgSKMLPF=
eqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-2B1Io8-2B=
jTZz5BTTim2A2uszKZcS9nVmUmh31EV2AwPw1R1Mj5LAnCzdfpUajlLI7FfEpIq6lZ41rLQhNF8=
B9-2FISUBDdes1noJEvXVUQ2tkkjTS6GzbE1g9S29RvupDd9EnEHmQt8qY9vgMTWNa8XSB9uZJU=
rnVpOx91IQM-2B7do7icE6TifU2fp-2FHUXJVBfQnU4QdFZORf6ltB4WPPi-2BCzoJXgXX-2B4D=
FNX-2BfDYbjjzHnMJLqXOWLKDtK74RTJJAr-2Fu8QD8NHFYAMsDdTdKlweP-2BDmNCNIlcUzV8N=
X-2BPgxWQzr-2F-2BDNGMalKQ1Z-2FWGisXXqzV6-2FnQIv0b6JMlXKK-2BLiztjmGedDtngjpB=
V1eOkbRI0Oxqc1KB8LyvvmHszbkU6t4XdATcPQOESMjmSk96KhjtU-2FW5UjxAg1aEJ5acmI1we=
HXVWVzqvi0doWR2ESV8rZdzHAZMXhD0v9u63Otv4NMqHBpP-2FXj3xKrJpxP-2FJQnGK2VzNynY=
hXzhsKHbE1Jbjm8mUJbG-2B1zfC9RsedjIhAGqX0OP0PWgc-2FicouVMQWoVgc80zdjGNehMbKU=
1-2Ba3hkqcdYfSWC18G-2BFeHM2MgNc3X9EAMnhEvxjmUvry5cvYgILTB6XTyKkEfUMgnC7dCFI=
182RvWE4uCAMXRDYC6ARstqVtARYDYIaJLOXss8nwBvlx4KBISsnH5-2F4EZ4W2ShMe3kjHYCpo=
MyeDj6rbjOvxxp-2FA-2F73NmmMfS-2Bk56fTUWzRDoRjQZPfD3dnZnZLi-2FQH3O0nXtiyH6j7=
sVqTkVKENBIkrV-2FF0klHdM-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0"=
 style=3D"height:1px !important;width:1px !important;border-width:0 !import=
ant;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !impo=
rtant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !i=
mportant;padding-right:0 !important;padding-left:0 !important;"/>
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
om/d/msgid/jailhouse-dev/F0x1FnRHTD6Z5L_h1JftdA%40ismtpd0163p1iad2.sendgrid=
.net?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/F0x1FnRHTD6Z5L_h1JftdA%40ismtpd0163p1iad2.sendgrid.net</a=
>.<br />

--7cbfc03bbb715a8a3494de60a6f6e2c7f54f4eee51e6ce8a991d98663757--
