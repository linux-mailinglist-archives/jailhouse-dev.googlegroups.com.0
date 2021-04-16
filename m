Return-Path: <jailhouse-dev+bncBDIO7H5HXQBBBWOZ42BQMGQEVA2Z66Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A13623E1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Apr 2021 17:27:22 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id i34-20020a0565123e22b0290190a1800b2dsf4032538lfv.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Apr 2021 08:27:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618586842; cv=pass;
        d=google.com; s=arc-20160816;
        b=AYFhyWx84RvasxIZ1RkT8+0OqOEPe9hRM1F80oQIf3ZBf7opxbn3pfamR3J9BxaOJp
         6NgoSP08QdHRj3GxKNVI4pZYADn6k3Jm/NJWeYYhvi8BwJpOZrvlwUJ8g7210RKMAUuR
         ZUSdKdGqX61UxrVtBtoRLjpLaRXVMaCGgzqT+8DuLRsEmtc35Y2D1HFyH8C9iO7CFKFD
         PVa/JGPOkrgxN8825YQMveAG7q/OKPVZvHKmDAeGUevB0V/YKPY+qgv66/p6hI0T0lCE
         Y3srmRnUNDJKcFEXYlaoQ8PG3A0C5PIIeTostvzHu8+GQKlfI2ongiwj5x3ztKKMuNlw
         4pew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:list-unsubscribe:subject:message-id:to
         :reply-to:mime-version:from:date:sender:dkim-signature;
        bh=9sVgZU1h0p7itzeWAeYE+BCcTC+Hk4RDQgIKABt7zI0=;
        b=Q3dp7LS5TnDSneIobzaTrDKDrL3LUlT7UFI8bryYCdtN5ARnKpUBzeDe7l+GGwMWkU
         B8FGUE5S4Udhzr1HJs55BxKOyuv3MaOGoPH9S7kOBorh4EmuTRwCEm/EGYbD+81W0Nny
         D9k0n4QdcRUshjzhqK3pYsSRcFyfQY5knwuAGgRaELSbR5UdG99w+ffezS882T8O3iHu
         hr70xUvqJ2+iXaV9HTZzikAfJy/OE2Jugzw0hoQ3HeaZ80e5xHN0YcdpqeQDhcEEcMYC
         kbWtUQX9vGx18+LsokVICEGhf+bPaAPBH7AWIry3J6Mc5EWl5P6MN3QlMrFU/8ODd8IA
         ZL6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=YoP4fPEe;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 198.21.1.157 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:mime-version:reply-to:to:message-id:subject
         :list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=9sVgZU1h0p7itzeWAeYE+BCcTC+Hk4RDQgIKABt7zI0=;
        b=baYUJSC546H9hiQX3iB5zFGd1hu7oAK7bgHTYsHbTJgYhs6R9Qk3u35iwfdDO01GpC
         a3/ozkT8CWmJBSfO1HfgxvCtj+V394tBV/TNHyQpgwzgSe0O4u4n8Su3bCyAxNiDEbTl
         zJCkrfkh9EeaSKyEFkfvowkvR7B2Oya1GYhlgm4dM2GccNLc9Gd2p/fElpMeH9uAiGFs
         sg7ka0rByzVI3Nks2V1/oEtwYyJZyBYU4BPKG0IZ1Qwxju0gop8Nm1GFG8ZWah11olt7
         1ihscpXpMUE8srX7fwge3O191qHW2YXizD6zxSp4QDgwKe8nkzs9PeApUHQsuHvtKR0N
         al0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:mime-version:reply-to:to
         :message-id:subject:list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=9sVgZU1h0p7itzeWAeYE+BCcTC+Hk4RDQgIKABt7zI0=;
        b=OirhdYDGvBOTXnJ7NHvJuoSNQO8GfXLu+IFiHNefsywVFhO5Wj/dYMaGTnIZt02lNs
         fNucw3gh1ghW0IYh+AGBpyRNBnKvy5nbVSME1k7ztITtBznL2mIkSMZU+ra7gq9gu6rY
         oEtdjKMTV4/AoRXyU9tKny9hmuhzRAz8iL33TDRqFvRnoAlrUN1A9RoElnCiSJJB3Jgf
         juzU3wzTKh04Sz5s8mNwaIyncWycec1SWzyEzn+N08xvUaQgVphQN6m1p1DLb8tEyI2N
         79OtTKVNj7adgtRbKAiDrKszFwmKSy5RmMvjRib+TS/sXDqZiThQ63nzqlS8+Zeu2oZj
         PV2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531L/oFcBvJa6jH1HjLouz/Zhox1AJZQuXcfMAd46kmFFhrqSwCs
	tgaoTmziINGP8Ah4VSckw4Y=
X-Google-Smtp-Source: ABdhPJzM9xtshpG8qHqyImYAFtDNDPXImMoej5cw5a3vEoHIMjTnS0/qQLneTPE1eDH1heZIS+Lksg==
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr3234743lfp.107.1618586841862;
        Fri, 16 Apr 2021 08:27:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls1935474ljj.10.gmail; Fri, 16 Apr
 2021 08:27:20 -0700 (PDT)
X-Received: by 2002:a2e:7d04:: with SMTP id y4mr3097126ljc.94.1618586840493;
        Fri, 16 Apr 2021 08:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618586840; cv=none;
        d=google.com; s=arc-20160816;
        b=Wwl2+EzDHMJI9sKdTcs1qCjlxBb1HMfB6/lwMj/F3sicevrNxmITyIeuMGP90qJ/Us
         dFOorOq7b+ETld6XChtZ6oeHGHHNzwkV3lQMucDA/UqkVclZ8U/+6kXc0nKH97SeC+D3
         pwOKK2bkKt7yrVy++ej8fFFRMinVT6yFMIh53IPE6oaJCD+Faor6S6NG7NdGH6TUj1ba
         2pkpgfdw8jVH2KlOLQE1N7czHE8IM0PmaZ5X180uREvALfe/0QA6q5iPBCTI8mNwQxyl
         pnXRX1xeS6DoDxfTZ8NfiLiSSwYXAaoYx6L5kbCOM4RH+X+p5LFYuVYCnHCLtauu9pzG
         w5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:subject:message-id:to:reply-to:mime-version:from
         :date:dkim-signature;
        bh=yGpW6FWr/5UGhl9DcXeEefotxP6BQFcLOXV0AyvNHOU=;
        b=JOXuRgB8W1byfgANe5ZZjabTarbESJ6EwNnEGGsmkF8xfS8WfSCIhuO+88060gJV0b
         WHKHh4wJTcNzBxoQIIA+uMkoWxE9Vi2MtRJ3bk2p890izRncbWTZrSVYlxAJgpuLpAgz
         sZjp1forOTlsT/pk8Wu2YMR5YS3hWeAmS3e8wsObr/XwcMNXsqqR82oL5puMw3Vwcj15
         puBrWMrtcx/jZZKy88YQOvt/Fm+FhHDOmeIGDB1U/hITQMapx2tNgmKua/vatNhQAvLm
         M+IJ20ApzOCTCt1XDcRRscYrG3wLxZNJQZwqsUufzvDuSBlqJRNBO/sIvkEKrho8hg53
         AycA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=YoP4fPEe;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 198.21.1.157 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Received: from cskrhkwd.outbound-mail.sendgrid.net (cskrhkwd.outbound-mail.sendgrid.net. [198.21.1.157])
        by gmr-mx.google.com with ESMTPS id w18si250315lft.10.2021.04.16.08.27.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Apr 2021 08:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 198.21.1.157 as permitted sender) client-ip=198.21.1.157;
Received: by filter1716p1iad2.sendgrid.net with SMTP id filter1716p1iad2-11297-6079ACD4-23
        2021-04-16 15:27:16.55603616 +0000 UTC m=+63919.701386976
Received: from MjEyNzE4NTg (unknown)
	by ismtpd0174p1mdw1.sendgrid.net (SG) with HTTP id Legiskg6T_2Z7-r4E84ztw
	Fri, 16 Apr 2021 15:27:16.513 +0000 (UTC)
Content-Type: multipart/alternative; boundary=71e2a54fdf3431c41dbc09824502fa8fff9b786c1f59bf7f0c6805a6946f
Date: Fri, 16 Apr 2021 15:27:18 +0000 (UTC)
From: "Jessa Walter" <jessa.walter@emailsprout.com>
Mime-Version: 1.0
Reply-To: jessa.walter@emailsprout.com
To: jailhouse-dev@googlegroups.com
Message-ID: <Legiskg6T_2Z7-r4E84ztw@ismtpd0174p1mdw1.sendgrid.net>
Subject: Aquire Red Hat Users
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mBq0SC8mAYw3aNt
 WVdnsimV/icyExIsTnmBAU0OXIg5Th3JvjSJCz/a/s7Fc0WSDTTYEshWL3AyTxvlsCzIfdLuPvu4ra
 Ny9R5qpo6NftyrX1MI0yZWfrBYkZIYP2hht0AjC4UdZo2xvbyWLNyeWkA7t6hpWoiSt+teZTOTLXmk
 p6EB2Yhs3LGRuv+VgxeMQT
X-SG-ID: mcTyqcYTtmn56LU3ATD1fx7RUQQI7NMQypbPv+7I3UCKtqqxc71YN+xqRe8pd6fC/hDurjfUz9QVi5
 COlh8t5BkN6qLueivXTNA7spmqc0Dj6GfWCjfq696fFflmy6LdHMCEhELT72WiNpU5+kTrfS5OdoYw
 xMR1BxKVaW3Fn6acKR18SPLJtvONXlnnRfF+gIGAfkeh1y+BOmelHs6rRm7CJcKa+N+DGD/o3x6bhs
 kI20EulH1wqpG8bvAbvQqVZgrSwH6PHPkdPkmjabQY0Y/PY0o87b8W5G3Fl0aLUnP+XQfPemlIrApV
 mnzGIFV8nvjAhE1YwAZxrvTlAnMFUgV9t9XdmwGFRB++56SHrSLAPE8T7Ep56LJo87piZa/nFDSdLD
 cxQykatZ06bOP29du5xACyC4u9rAkA+Ue7vomdfPGGLB5TzLZITNjG9f4zd+H4fjTxQLL1T9Amy9ME
 4z2dVeMmFtrfiiZ+ONbv0ok3MFfr1JeWxNNwjI2KL1X2cHPJONEzGvrHiOYR6ZgXdSiMwLjmfOwkwo
 C+S4XTyXiUZGCnsb7XHoW8zfqIjShR3iHt7Sq1kF1Ua3NgfrSUJsNluH6fGDxnAM66XZkxP+HvUufP
 bxgu4z/9qXhObiIZ
X-Entity-ID: iqBoCwjxWcX3ZhfJcdnXBg==
X-Original-Sender: jessa.walter@emailsprout.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@sendgrid.net header.s=smtpapi header.b=YoP4fPEe;       spf=pass
 (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net
 designates 198.21.1.157 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--71e2a54fdf3431c41dbc09824502fa8fff9b786c1f59bf7f0c6805a6946f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Hi,

I have researched on LinkedIn that you are responsible for Sales operations=
 at your company =C2=A0for creating and managing the end-to-end enterprise =
sales process, including leading the implementation of pipeline reporting, =
sales forecasting, and sales analytics.

This data will help your sales team to execute on the account plan to deliv=
er maximum revenue potential, generate new business in new accounts and exp=
and footprint of Red Hat customers.

Would you like to *acquire Red Hat Users* for your sales and marketing team=
s?

We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.

I will look forward to your response.

Thanks,

*Jessa Walter*
Global Lead Generation
Email Sprout, Inc
North America

Jessa Walter

885 Watson Street , Camden , NJ 08102

Unsubscribe ( https://u21271858.ct.sendgrid.net/wf/unsubscribe?upn=3DVU2koN=
EWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-=
2B1Io8-2BjTZz5I8kC40iO3WOtB83c-2BF9hkfoUZlv9nmlG0U1hJbBdClAk5UZKOuMOTnD0MO5=
dswUjSNHobMLYFh-2FXPmWRgyyEKYLLhFe3VQ7iCsN2DfWLNzujPmD2NZjPI1XwWc0WQye46WyQ=
xscSQpSRLTFmUOgXK2mMOvS27wkXkWuCtLUGMKbz50dg6fnSDI-2FgbdB1xndUUVSenlag6jVum=
NvfXbMbISiwRtRu7ByFMMxko3AE-2BV0m0KdmD2uvUMZvFogtuh4S6au3UgrQJrI-2B8ZCKFEkv=
BmgO124pmvtrGtPMRgXiKqPjWX63W0oByHaQBfyHUceRClJTVytyX9Bz-2BX-2FZdZ928VlZsJz=
OMjMQNQdqWTaTMGPANKLXSjEOy2pgpWn-2BOvoOF2ReXIzRaDXF8UO1MhAedgmPrtL6akkDBYZG=
-2FcnQ1cEvHy0Qyz0THh6gt-2Bveia63JMdGLpQU04BqGdoCqeT2lQSeuqf09HCgS-2FzlNyXcO=
XiM8D6SCTSoEJ7P-2BM8H-2B8EmcSVYaWZoEmkFr9vAgB32fUszhNby0RQbFfhk4ceIs1o36Ly8=
5gj7ELTFdOmoQPdFMMTh6GfwrvKpSCklaW9HxM8s1nXOCOh3KjpKZONo5fzJ7Xc1Tmmo-2BMXD9=
1qNGN1Kl7WFvjQNOyJTDuxZ0QtjlpSdVRspGWbevBty7osOtazNLTVej7lBwcXqVo-2Fak6k8P6=
XghiDi0kFL8A-2FzUCOK-2BIpXYiyOE16SrWTwohay8KuYgfJdqzUryjDiVLZsSo8r7KStxaEfR=
7TR8AduBUrR7U-3D )

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/Legiskg6T_2Z7-r4E84ztw%40ismtpd0174p1mdw1.sendgrid.net.

--71e2a54fdf3431c41dbc09824502fa8fff9b786c1f59bf7f0c6805a6946f
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
yout: fixed;" data-muid=3D"bf4e0fe6-2ad6-4fd7-9623-060eb5e77187">
    <tbody>
      <tr>
        <td style=3D"padding:18px 0px 18px 0px; line-height:22px; text-alig=
n:inherit;" height=3D"100%" valign=3D"top" bgcolor=3D"" role=3D"module-cont=
ent"><div><div style=3D"font-family: inherit">Hi,<br>
<br>
I have researched on LinkedIn that you are responsible for Sales operations=
 at your company &nbsp;for creating and managing the end-to-end enterprise =
sales process, including leading the implementation of pipeline reporting, =
sales forecasting, and sales analytics.<br>
<br>
This data will help your sales team to execute on the account plan to deliv=
er maximum revenue potential, generate new business in new accounts and exp=
and footprint of Red Hat customers.<br>
<br>
Would you like to <strong>acquire Red Hat Users</strong> for your sales and=
 marketing teams?<br>
<br>
We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.<br>
<br>
I will look forward to your response.<br>
<br>
Thanks,<br>
<br>
<strong>Jessa Walter</strong><br>
Global Lead Generation<br>
Email Sprout, Inc<br>
North America</div>
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
aOPsPJfFcqrQhM-2F5O-2B1Io8-2BjTZz5I8kC40iO3WOtB83c-2BF9hkfoUZlv9nmlG0U1hJbB=
dClAk5UZKOuMOTnD0MO5dswUjSNHobMLYFh-2FXPmWRgyyEKYLLhFe3VQ7iCsN2DfWLNzujPmD2=
NZjPI1XwWc0WQye46WyQxscSQpSRLTFmUOgXK2mMOvS27wkXkWuCtLUGMKbz50dg6fnSDI-2Fgb=
dB1xndUUVSenlag6jVumNvfXbMbISiwRtRu7ByFMMxko3AE-2BV0m0KdmD2uvUMZvFogtuh4S6a=
u3UgrQJrI-2B8ZCKFEkvBmgO124pmvtrGtPMRgXiKqPjWX63W0oByHaQBfyHUceRClJTVytyX9B=
z-2BX-2FZdZ928VlZsJzOMjMQNQdqWTaTMGPANKLXSjEOy2pgpWn-2BOvoOF2ReXIzRaDXF8UO1=
MhAedgmPrtL6akkDBYZG-2FcnQ1cEvHy0Qyz0THh6gt-2Bveia63JMdGLpQU04BqGdoCqeT2lQS=
euqf09HCgS-2FzlNyXcOXiM8D6SCTSoEJ7P-2BM8H-2B8EmcSVYaWZoEmkFr9vAgB32fUszhNby=
0RQbFfhk4ceIs1o36Ly85gj7ELTFdOmoQPdFMMTh6GfwrvKpSCklaW9HxM8s1nXOCOh3KjpKZON=
o5fzyCCMJb-2FvzTxE0Nqq8kA-2BNVIwT-2B4JWYqVR5KQQnMI15UyLt8sg2Mg684ZkXDUPK4Kh=
JGco9IAzARBynAdCNDfvIk3DuNq1Fh5MMkqCPkqECJr-2BP20PqAmW-2Bum9eThAXVkGXBf-2BT=
-2Fy6HRNJtKu71TOV0HR-2FC4oPbZiORkIjVT85R4-3D" target=3D"_blank" style=3D"">=
Unsubscribe</a></p></div></td>
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
jTZz5I8kC40iO3WOtB83c-2BF9hkfoUZlv9nmlG0U1hJbBdClAk5UZKOuMOTnD0MO5dswUjSNHo=
bMLYFh-2FXPmWRgyyEKYLLhFe3VQ7iCsN2DfWLNzujPmD2NZjPI1XwWc0WQye46WyQxscSQpSRL=
TFmUOgXK2mMOvS27wkXkWuCtLUGMKbz50dg6fnSDI-2FgbdB1xndUUVSenlag6jVumNvfXbMbIS=
iwRtRu7ByFMMxko3AE-2BV0m0KdmD2uvUMZvFogtuh4S6au3UgrQJrI-2B8ZCKFEkvBmgO124pm=
vtrGtPMRgXiKqPjWX63W0oByHaQBfyHUceRClJTVytyX9Bz-2BX-2FZdZ928VlZsJzOMjMQNQdq=
WTaTMGPANKLXSjEOy2pgpWn-2BOvoOF2ReXIzRaDXF8UO1MhAedgmPrtL6akkDBYZG-2FcnQ1cE=
vHy0Qyz0THh6gt-2Bveia63JMdGLpQU04BqGdoCqeT2lQSeuqf09HCgS-2FzlNyXcOXiM8D6SCT=
SoEJ7P-2BM8H-2B8EmcSVYaWZoEmkFr9vAgB32fUszhNby0RQbFfhk4ceIs1o36Ly85gj7ELTFd=
OmoQPdFMMTh6GfwrvKpSCklaW9HxM8s1nXOCOh3KjpKZONo5fzAHa-2FrXF9wsSWPCdpAHIgoXH=
qKNNzbVo4tqf-2BR1NH8eA1eKH1PJNp8T3xWZaNPxGHAfI9iIR2EYj2kpNtQiFai8N0MDgec7rz=
4p5qERI7-2BIGS79mJNkwn-2FkIKEIz0LhFrZpfkAm4zCbVhqgs09Au0uYAHrXNvbVueNerC6GU=
ysGeIxdGW88tLcZs28U0dtEMO" alt=3D"" width=3D"1" height=3D"1" border=3D"0" s=
tyle=3D"height:1px !important;width:1px !important;border-width:0 !importan=
t;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !import=
ant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !imp=
ortant;padding-right:0 !important;padding-left:0 !important;"/>
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
om/d/msgid/jailhouse-dev/Legiskg6T_2Z7-r4E84ztw%40ismtpd0174p1mdw1.sendgrid=
.net?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/Legiskg6T_2Z7-r4E84ztw%40ismtpd0174p1mdw1.sendgrid.net</a=
>.<br />

--71e2a54fdf3431c41dbc09824502fa8fff9b786c1f59bf7f0c6805a6946f--
