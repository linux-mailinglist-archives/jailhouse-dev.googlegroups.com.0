Return-Path: <jailhouse-dev+bncBDIO7H5HXQBBB3E77SBQMGQEHE6WKHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C15365EA2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 19:31:25 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id o94-20020a17090a0a67b029014e11affd68sf19842851pjo.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 10:31:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618939884; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cg6B6l2VczlEfRTu/ecH4V2lT4mhKq4eVeDbGXgfztEEZyaoCvdigjSq0CS0nN/mIn
         uSeLh2xsKrDYOnBzCMCKQg+tuR0a3CrAtPuQfJJsex8lHw1EK5ebDOarlmRDAepANWg1
         ACHzEqn4Nw3cxZM2yDh4cKU65rIMxrY3SArb/rCXfdxymTdJAXHEqGIKwiKVgtvmBm91
         dit9nLjG3h3exVEMKqfqxTdwgiPhDZdrD7dqn/0yn8kSugnu5NyP7XHPwpHS3FXi5n7j
         1TMV3JL4XQUBAyYSwNzQV0pADz1KI3BrdPkLaqtoNKSFWbh8RLHT1+uqdLe0KeqWZSYv
         XxgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:list-unsubscribe:subject:message-id:to
         :reply-to:mime-version:from:date:sender:dkim-signature;
        bh=D27HnR72y/hKeHoFnTWZTqEG7B3L7SF3tAkgUWnoY8g=;
        b=y6NBEYpJYq6LXuN6RPStoly4uDKmVJvGx+KP/DXBE27rLvIITh6HcstkHRaXh61V9D
         L5SwbKVXFi5pBsIBdIi+vTUDkBCm9+FgRKufPSKUYWyigNjSuc9thD0uhOQhG+QTuz++
         69mA6xOR/mj5rgJqocb9AeXarbSzy8MCvplSnBntgcQWd3UIt4T2kJS+NcJiW8KL1Fee
         Ke5x7Fh/gkY7b8L2XhcyjIQrHzv/8H8/I86g0fwZKtAS7/SdyIH5Pg8+ivLGNvyWXK0n
         hH9T2laIJwX5C5n0ZzbpE9XNb+ifJOqxjUgezhUMkygU5D1CMfKAW4uTrDjS3f81vkiH
         ENcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=sjVxN1qA;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:mime-version:reply-to:to:message-id:subject
         :list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=D27HnR72y/hKeHoFnTWZTqEG7B3L7SF3tAkgUWnoY8g=;
        b=S7hTw8xl8hiRopLDZhpdstChx3wcBmeVeBFvDvliXhsrIT7lRZLLFa6pNEwflhw4xJ
         v5uROHFKcOcovVuiKcEo7d01JME6MaO7YJdvILRSJm2KR8mZ5UfcQnVF0a2+BEiXCNSe
         XmlysQq0bpkySreEscCsQHt+DZ0rp7fFBwY6wh+P3/yzlxLIKWvPVIOQPkY56g3WpDwO
         u4uO001++gGeLB9zLOZ7XvTVn2kxDCFh6v6Rq4cLZ99qTB+zmuhTyPfRfgatEn+XE5gj
         Ifay+eQmK8MtXrNZFahbnE4yW4zaPCxbHxq+XYJajyqtsfgsvC4QMbfKucBG6seTi9FR
         4Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:mime-version:reply-to:to
         :message-id:subject:list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=D27HnR72y/hKeHoFnTWZTqEG7B3L7SF3tAkgUWnoY8g=;
        b=KGMgVyiGgsvRbVrv6dwjbwzGL6EchFeEocCE5fkZYdTJIZLhYEk/APIg/95nXCySK/
         pNtTeo8Py0K6LQ87NtCZsDj+N68OZTCG+Z+l8wzd3giwGby5pTOexkSHj+z9OWy01A+l
         WXN3RxJKiuoFEo81A3y9wPI0C2asmgsYVQBV9MOi2/HVq6hr1JnWbmDMNEFStPRvVB6r
         SzY77jn8yeuqNSp0l0BvtZf2VaFrSrMV20vxgGF+luK4aOEk50Jv2pOtgPIM5Sud/96t
         rtNDJnXgemKH4XNefiNWlBiskMbXqFQyca+nmCo9zaxcUPbKPqOnqh3pPcX8yUBaXS/L
         t/vA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532tETVPAVmQpyxnNNe3qM/4qeiu4q66GppBVSRL09elJOmb2SlP
	lHEFYkShY1Dh703fyVy9HAk=
X-Google-Smtp-Source: ABdhPJy0OVV1Qx3C/HIBQZClTpH2po82cvvvrEFs+wBoWMrllXltiWt2lvzwp7zR9ssXwRi9acwr5Q==
X-Received: by 2002:a17:902:ec84:b029:ea:b28d:e53e with SMTP id x4-20020a170902ec84b02900eab28de53emr29175038plg.77.1618939884698;
        Tue, 20 Apr 2021 10:31:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:fd4a:: with SMTP id m10ls6477035pgj.7.gmail; Tue, 20 Apr
 2021 10:31:24 -0700 (PDT)
X-Received: by 2002:a63:e242:: with SMTP id y2mr18477834pgj.298.1618939883946;
        Tue, 20 Apr 2021 10:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618939883; cv=none;
        d=google.com; s=arc-20160816;
        b=eqUJ3w+kT1XoGpo1XJuPUy5tWHH2o6IgbeevZc+PMRFMIXx5qqfH/zCN/KyEOLwa7j
         G0KlIVj4m3rwAi7je6gKy54l4mI7BHcNHwS8UDtPLRUdAeMJRxtX5sob5vumHcGLDJpk
         u4vTpawesayPRWgq7prIMjKjeVDe9Drr6/fWvxTDdmhBoChH/FyYlZb9Xbn+lnaC8N5Q
         UJN+hkkASM6BolnFHMM56ImJdXqvBG+AEq2ZzQLfAWxEhsJdF4DbBMyM2ZgS8K5ivL6F
         xfZZFNqd4CZuzqMQueXTKoLL+XMSlZKJ/8C+pyMiyFBOdR4I8SZkqyg1G6ekqMl5hdI0
         4h7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:subject:message-id:to:reply-to:mime-version:from
         :date:dkim-signature;
        bh=6UZP6exaVQ/8kb7wqk6zk6YeyNEPZe3+ppxgJc8WUQ0=;
        b=lmKSsldWwJx9d6qo7wmdSqmF2nBwfl/ywGxYWbEYFpl94GVFT5/+opd765ZqXe2Xx5
         spSNdVosFpSC5r6O3Rlkg6r34SXs+tzyY69JiYRW2uD4wo1tGxzL+0MTAd64kr5IdkBX
         ZOS+00YkY9fzfg9vKyqnVeSa62luytZovkqKAGPRQfmJCTkFbDTNqgDISRS4MuQQYliG
         o5Mq38d7XIo6+MgLl3OYvr/A7O7On6S6V3m+vzCZRkUjXpROEsSeYc4Yh//GO5PsEtuj
         D+z3/YPsRqGoj/Za0rCkkRY8Ylm82S8iJxvY0vEM1pHddj1FF0wKUkvdJQOCCZUu9sS9
         bNMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=sjVxN1qA;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Received: from wrqvxsnb.outbound-mail.sendgrid.net (wrqvxsnb.outbound-mail.sendgrid.net. [149.72.166.43])
        by gmr-mx.google.com with ESMTPS id ci2si323108pjb.2.2021.04.20.10.31.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 10:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.166.43 as permitted sender) client-ip=149.72.166.43;
Received: by filter2685p1mdw1.sendgrid.net with SMTP id filter2685p1mdw1-21982-607F0FE7-41
        2021-04-20 17:31:19.931298966 +0000 UTC m=+417360.516158709
Received: from MjEyNzE4NTg (unknown)
	by geopod-ismtpd-6-0 (SG) with HTTP id g4OMWP1dTmWTXSXPAQjsQw
	Tue, 20 Apr 2021 17:31:19.866 +0000 (UTC)
Content-Type: multipart/alternative; boundary=aefe7c3f618eb779124ce0c3cd6cf23a096a967733fa7bb7f8af451c7cea
Date: Tue, 20 Apr 2021 17:31:22 +0000 (UTC)
From: "Jessa Walter" <jessa.walter@emailsprout.com>
Mime-Version: 1.0
Reply-To: jessa.walter@emailsprout.com
To: jailhouse-dev@googlegroups.com
Message-ID: <g4OMWP1dTmWTXSXPAQjsQw@geopod-ismtpd-6-0>
Subject: Looking for high contact accuracy data?
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mXhewAK3D7uYBNu
 qdHfXB5Kg6vIWC8EtlyYJ+Q8+S/8ibr7STrmYZSJwNoI/RZoyYEgBP0mOZP9ZSP4o2zG8SWf5uhkwG
 NgrKy/OpDHe2q1E5iBLV5iqUwnojMTKbpdmdavDNK9u1wKxrijRUYLymjHN4qILNYVug1riBLGhdam
 +jsKDsykTWqAQ+T+7R3L8y
X-SG-ID: mcTyqcYTtmn56LU3ATD1f4ZssErxExLgANPDjKLkSdr4zOPEvcBgpBKJpMZRJ99TEpDSh8LTJPsePi
 dqcGPaP1XaXd7SJiQb9GWwfWYbEDe89AKUaR4YdUx66MvRP9CxDVUsH2klbPmUqod75GHzyNaZrOKc
 17mi00I2+EodrRrpvV91ifhO/15MyxDCUQsD7fF7laES64h7j8EHftH8Ul4ni4W1+4NqabhdzxBf5W
 Xny+wDSbshM4eqKGvcLZvBMQ8kPR+1yAXvVTYsbFb8KBvuFuN/wwFO4i59ZzK4ErQ1KoUFbbWbKCQ9
 uLMuOHXpgycnFr73l5hl6r5RQuAtM+ge6K8tzPUM83VCbCmPGd4AXKEn6IqffCjgBn64Jkd9g08Oq6
 R4H7+KkAj+4hda+pttpMI0qadDHM8ud14zu+UjS4n5EUVO8Ob36U1JC90IifL/MJ6HgHE00uSUGZ91
 4j4+qQVAITR7ajfQbx8dhccfIjaBCpOQ1HRoZ9CcM8XLuqu5LzpymtvtFWPcxAuOmCRP1OkEFswZ/t
 qs+pLUrLh9Tt6qkwNVfDEr2Tijov/52UEGys3q+VpprsnVYwAx5Ly4OB2PYuVTwxGt3zdbIn5qgfa2
 sTdDd13P9a7leMSxOM5zgAql/JslKq2vcv+nGTnGtrCN/OioXI7t3ZT/Z38U9mkZCiaMlDDGBGEV4A
 Vx
X-Entity-ID: iqBoCwjxWcX3ZhfJcdnXBg==
X-Original-Sender: jessa.walter@emailsprout.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@sendgrid.net header.s=smtpapi header.b=sjVxN1qA;       spf=pass
 (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net
 designates 149.72.166.43 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--aefe7c3f618eb779124ce0c3cd6cf23a096a967733fa7bb7f8af451c7cea
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Hi,

Are you *looking for high contact accuracy data* i.e. contact currently wor=
king in the company?

We are providing our customers with company and contact information (e-mail=
, phone) with live social media links (Twitter, Facebook, Linked-In) to max=
imize their reach through different channels.

Let us know your target audience in terms of Industry, Geography and Titles=
? so we can run counts and samples for you to review.

Thanks & Regards,

*Jessa Walter*
Global Lead Generation
Email Sprout, Inc
North America

Jessa Walter

885 Watson Street , Camden , NJ 08102

Unsubscribe ( https://u21271858.ct.sendgrid.net/wf/unsubscribe?upn=3DVU2koN=
EWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-=
2B1Io8-2BjTZz5M2TG2L4ohN-2FPOLhIUtyl-2Blt-2B711zDPNuJLkMzp9sF2LNignvuwcRlfx=
yyacxOjgoeJ-2FKsD2U2GBtHLZoG27qjVzBQaEpPtKHWhE1-2BzkQ5FEyvjUL9igfRRr1COlhtO=
mE9GplF-2Btf2TEjlgT4hrLPrnZqmL1JqOpE-2Bg3KrnMNWo-2FLeC0zWZQM1vayxYmkVxoKC62=
aglNQS8V8aFkO-2BG-2Ff6YPPLiJifh6wfYxk6XvqaThOpuNMOdJxHqiUZsdYpv4YiU9ARXCiNx=
3iYZRGNApXM1oPlPfr-2FpqxRFdx8HAbNQThdW4K8rQrC4hOf0aqGTtrIHPt0e7RRynKrNpxXBc=
IUymUHtQDke4voMrVuAuKSf8A4b-2F0ECODI5JDU38ApbisFVW0AuaXxdgdku96FhLrt-2B8cgp=
Q-2BIIE-2BeTDezlGRqaLfZXYmqTCExrjUhhDx-2FPp6pKe0K-2Bf7EmrjIihrrYlbhuGYksBwN=
h1bs8ggw4Iy0B5v15a0vOHG7Pmlo2l1pzLnPH7FJPNJucsmTOJvwZZh2nUYBu8ijJg4wzlaU1YW=
czK8r0OHPRfAEB5sh7FyLoPItBR62-2F72REC6y-2F9MJqRv7tCDDbsL-2FE1JI9QjYNakgQO78=
pKiNyXNk9HyoJMiV8EEpK4e-2FK2DI2tDNLprvIccaH7ENQOfwVilk6Srb218kEvK8Ja7mjJ7St=
m8nidfHiMf3ZmRviThc1dHkhr0fsYNMIK-2BmBXrIH7kUL6O-2FbUBtrWkjEdC1az-2F3t6irGs=
BoEknuNQABSq0ga1qRvOOSljVSB60xKacAKnmZx-2FB4PMYX7Ai6LiG8xRZqmDiUt3PmlpCP1v-=
2Baya2og3FLLVOvPDiiI-3D )

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/g4OMWP1dTmWTXSXPAQjsQw%40geopod-ismtpd-6-0.

--aefe7c3f618eb779124ce0c3cd6cf23a096a967733fa7bb7f8af451c7cea
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
    ul ul ul ul  {
      list-style-type: disc !important;
    }
    ol ol {
      list-style-type: lower-roman !important;
    }
    ol ol ol {
      list-style-type: lower-latin !important;
    }
    ol ol ol ol {
      list-style-type: decimal !important;
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
        <p></p>
      </td>
    </tr>
  </table><table class=3D"module" role=3D"module" data-type=3D"text" border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"table-la=
yout: fixed;" data-muid=3D"19f1cad7-fff7-42a7-b4da-0dbbadec8f10" data-mc-mo=
dule-version=3D"2019-10-22">
    <tbody>
      <tr>
        <td style=3D"padding:18px 0px 18px 0px; line-height:22px; text-alig=
n:inherit;" height=3D"100%" valign=3D"top" bgcolor=3D"" role=3D"module-cont=
ent"><div><div style=3D"font-family: inherit; text-align: inherit">Hi,<br>
<br>
Are you &nbsp;<strong>looking for high contact accuracy data </strong>i.e. =
contact currently working in the company?<br>
<br>
We are providing our customers with company and contact information (e-mail=
, phone) with live social media links (Twitter, Facebook, Linked-In) to max=
imize their reach through different channels.<br>
<br>
Let us know your target audience in terms of Industry, Geography and Titles=
? so we can run counts and samples for you to review.<br>
<br>
Thanks &amp; Regards,<br>
<br>
<strong>Jessa Walter</strong><br>
Global Lead Generation<br>
Email Sprout, Inc<br>
North America</div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div><div></div></div></td>
      </tr>
    </tbody>
  </table><div data-role=3D"module-unsubscribe" class=3D"module" role=3D"mo=
dule" data-type=3D"unsubscribe" style=3D"color:#444444; font-size:12px; lin=
e-height:20px; padding:16px 16px 16px 16px; text-align:Center;" data-muid=
=3D"4e838cf3-9892-4a6d-94d6-170e474d21e5"><div class=3D"Unsubscribe--addres=
sLine"><p class=3D"Unsubscribe--senderName" style=3D"font-size:12px; line-h=
eight:20px;">Jessa Walter</p><p style=3D"font-size:12px; line-height:20px;"=
><span class=3D"Unsubscribe--senderAddress">885 Watson Street</span>, <span=
 class=3D"Unsubscribe--senderCity">Camden</span>, <span class=3D"Unsubscrib=
e--senderState">NJ</span> <span class=3D"Unsubscribe--senderZip">08102</spa=
n></p></div><p style=3D"font-size:12px; line-height:20px;"><a class=3D"Unsu=
bscribe--unsubscribeLink" href=3D"https://u21271858.ct.sendgrid.net/wf/unsu=
bscribe?upn=3DVU2koNEWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZE=
aOPsPJfFcqrQhM-2F5O-2B1Io8-2BjTZz5M2TG2L4ohN-2FPOLhIUtyl-2Blt-2B711zDPNuJLk=
Mzp9sF2LNignvuwcRlfxyyacxOjgoeJ-2FKsD2U2GBtHLZoG27qjVzBQaEpPtKHWhE1-2BzkQ5F=
EyvjUL9igfRRr1COlhtOmE9GplF-2Btf2TEjlgT4hrLPrnZqmL1JqOpE-2Bg3KrnMNWo-2FLeC0=
zWZQM1vayxYmkVxoKC62aglNQS8V8aFkO-2BG-2Ff6YPPLiJifh6wfYxk6XvqaThOpuNMOdJxHq=
iUZsdYpv4YiU9ARXCiNx3iYZRGNApXM1oPlPfr-2FpqxRFdx8HAbNQThdW4K8rQrC4hOf0aqGTt=
rIHPt0e7RRynKrNpxXBcIUymUHtQDke4voMrVuAuKSf8A4b-2F0ECODI5JDU38ApbisFVW0AuaX=
xdgdku96FhLrt-2B8cgpQ-2BIIE-2BeTDezlGRqaLfZXYmqTCExrjUhhDx-2FPp6pKe0K-2Bf7E=
mrjIihrrYlbhuGYksBwNh1bs8ggw4Iy0B5v15a0vOHG7Pmlo2l1pzLnPH7FJPNJucsmTOJvwZZh=
2nUYBu8ijJg4wzlaU1YWczK8r0OHPRfAEB5sh7FyLoPItBR62-2F72REC6y-2F9MJqRv7tCDDbs=
L-2FE1JI9QjYNakgQO78pKiNyXNk9HyoJMiV8EEpK4e-2FK2DI2tDNLprvIccaH7ENQOfwVilk6=
Srb218kEvyY2pcA8Cr1k8oS0RCOsfBgcq-2FCQoJ5xRNNBA-2B7OBq1F7976ZoGBqyphDBaa5I6=
468p0jPvx6JYh-2BzsUHlCTqQXPh-2B7cXaZH7vxSbQAcq15Lig9BWuhCxHYJOLQ6mPhh8iFz6Z=
UTMKxS-2FkzA93vEKNYHuG8-2FaCw7HGGK23AIAo94-3D" target=3D"_blank" style=3D""=
>Unsubscribe</a></p></div></td>
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
<img src=3D"https://u21271858.ct.sendgrid.net/wf/open?upn=3DVU2koNEWgSKMLPF=
eqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-2B1Io8-2B=
jTZz5M2TG2L4ohN-2FPOLhIUtyl-2Blt-2B711zDPNuJLkMzp9sF2LNignvuwcRlfxyyacxOjgo=
eJ-2FKsD2U2GBtHLZoG27qjVzBQaEpPtKHWhE1-2BzkQ5FEyvjUL9igfRRr1COlhtOmE9GplF-2=
Btf2TEjlgT4hrLPrnZqmL1JqOpE-2Bg3KrnMNWo-2FLeC0zWZQM1vayxYmkVxoKC62aglNQS8V8=
aFkO-2BG-2Ff6YPPLiJifh6wfYxk6XvqaThOpuNMOdJxHqiUZsdYpv4YiU9ARXCiNx3iYZRGNAp=
XM1oPlPfr-2FpqxRFdx8HAbNQThdW4K8rQrC4hOf0aqGTtrIHPt0e7RRynKrNpxXBcIUymUHtQD=
ke4voMrVuAuKSf8A4b-2F0ECODI5JDU38ApbisFVW0AuaXxdgdku96FhLrt-2B8cgpQ-2BIIE-2=
BeTDezlGRqaLfZXYmqTCExrjUhhDx-2FPp6pKe0K-2Bf7EmrjIihrrYlbhuGYksBwNh1bs8ggw4=
Iy0B5v15a0vOHG7Pmlo2l1pzLnPH7FJPNJucsmTOJvwZZh2nUYBu8ijJg4wzlaU1YWczK8r0OHP=
RfAEB5sh7FyLoPItBR62-2F72REC6y-2F9MJqRv7tCDDbsL-2FE1JI9QjYNakgQO78pKiNyXNk9=
HyoJMiV8EEpK4e-2FK2DI2tDNLprvIccaH7ENQOfwVilk6Srb218kEv3yg2hSOUSGprRy0MH9tA=
WMYwrfFCOA-2FWKC2XvdHcUt-2Bof3xeXmdrChz1blXgYPw4fCaJcICOrds16Qsfds2XArkq1Cg=
c6xroEdSIHlx1DXR-2FbPklZ9TJOMrDZe-2FWqbQr4QBeXI9stltFboz8mcwJRqMaiZgN4keHqz=
tDN8OaqLc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/>
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
om/d/msgid/jailhouse-dev/g4OMWP1dTmWTXSXPAQjsQw%40geopod-ismtpd-6-0?utm_med=
ium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhous=
e-dev/g4OMWP1dTmWTXSXPAQjsQw%40geopod-ismtpd-6-0</a>.<br />

--aefe7c3f618eb779124ce0c3cd6cf23a096a967733fa7bb7f8af451c7cea--
